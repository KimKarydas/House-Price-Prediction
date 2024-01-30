{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "e12df613",
   "metadata": {
    "_execution_state": "idle",
    "_uuid": "051d70d956493feee0c6d64651c6a088724dca2a",
    "execution": {
     "iopub.execute_input": "2024-01-30T19:36:44.840778Z",
     "iopub.status.busy": "2024-01-30T19:36:44.837646Z",
     "iopub.status.idle": "2024-01-30T19:36:46.062271Z",
     "shell.execute_reply": "2024-01-30T19:36:46.060395Z"
    },
    "papermill": {
     "duration": 1.237727,
     "end_time": "2024-01-30T19:36:46.065712",
     "exception": false,
     "start_time": "2024-01-30T19:36:44.827985",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "── \u001b[1mAttaching core tidyverse packages\u001b[22m ──────────────────────── tidyverse 2.0.0 ──\n",
      "\u001b[32m✔\u001b[39m \u001b[34mdplyr    \u001b[39m 1.1.4     \u001b[32m✔\u001b[39m \u001b[34mreadr    \u001b[39m 2.1.4\n",
      "\u001b[32m✔\u001b[39m \u001b[34mforcats  \u001b[39m 1.0.0     \u001b[32m✔\u001b[39m \u001b[34mstringr  \u001b[39m 1.5.1\n",
      "\u001b[32m✔\u001b[39m \u001b[34mggplot2  \u001b[39m 3.4.4     \u001b[32m✔\u001b[39m \u001b[34mtibble   \u001b[39m 3.2.1\n",
      "\u001b[32m✔\u001b[39m \u001b[34mlubridate\u001b[39m 1.9.3     \u001b[32m✔\u001b[39m \u001b[34mtidyr    \u001b[39m 1.3.0\n",
      "\u001b[32m✔\u001b[39m \u001b[34mpurrr    \u001b[39m 1.0.2     \n",
      "── \u001b[1mConflicts\u001b[22m ────────────────────────────────────────── tidyverse_conflicts() ──\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mfilter()\u001b[39m masks \u001b[34mstats\u001b[39m::filter()\n",
      "\u001b[31m✖\u001b[39m \u001b[34mdplyr\u001b[39m::\u001b[32mlag()\u001b[39m    masks \u001b[34mstats\u001b[39m::lag()\n",
      "\u001b[36mℹ\u001b[39m Use the conflicted package (\u001b[3m\u001b[34m<http://conflicted.r-lib.org/>\u001b[39m\u001b[23m) to force all conflicts to become errors\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "'usa-real-estate-dataset'"
      ],
      "text/latex": [
       "'usa-real-estate-dataset'"
      ],
      "text/markdown": [
       "'usa-real-estate-dataset'"
      ],
      "text/plain": [
       "[1] \"usa-real-estate-dataset\""
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "# This R environment comes with many helpful analytics packages installed\n",
    "# It is defined by the kaggle/rstats Docker image: https://github.com/kaggle/docker-rstats\n",
    "# For example, here's a helpful package to load\n",
    "\n",
    "library(tidyverse) # metapackage of all tidyverse packages\n",
    "\n",
    "# Input data files are available in the read-only \"../input/\" directory\n",
    "# For example, running this (by clicking run or pressing Shift+Enter) will list all files under the input directory\n",
    "\n",
    "list.files(path = \"../input\")\n",
    "\n",
    "# You can write up to 20GB to the current directory (/kaggle/working/) that gets preserved as output when you create a version using \"Save & Run All\" \n",
    "# You can also write temporary files to /kaggle/temp/, but they won't be saved outside of the current session"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "236e7984",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-01-30T19:36:46.108155Z",
     "iopub.status.busy": "2024-01-30T19:36:46.077228Z",
     "iopub.status.idle": "2024-01-30T19:36:46.121636Z",
     "shell.execute_reply": "2024-01-30T19:36:46.119886Z"
    },
    "papermill": {
     "duration": 0.053524,
     "end_time": "2024-01-30T19:36:46.124115",
     "exception": false,
     "start_time": "2024-01-30T19:36:46.070591",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "#Libraries\n",
    "library(dplyr)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "ced79c09",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-01-30T19:36:46.136269Z",
     "iopub.status.busy": "2024-01-30T19:36:46.134765Z",
     "iopub.status.idle": "2024-01-30T19:36:53.715691Z",
     "shell.execute_reply": "2024-01-30T19:36:53.713465Z"
    },
    "papermill": {
     "duration": 7.590196,
     "end_time": "2024-01-30T19:36:53.718705",
     "exception": false,
     "start_time": "2024-01-30T19:36:46.128509",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# Paste the copied path here\n",
    "dataset_path <- \"/kaggle/input/usa-real-estate-dataset/realtor-data.zip.csv\"\n",
    "\n",
    "# Read the dataset into a data frame\n",
    "df <- read.csv(dataset_path)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "b620aab3",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-01-30T19:36:53.730934Z",
     "iopub.status.busy": "2024-01-30T19:36:53.729344Z",
     "iopub.status.idle": "2024-01-30T19:36:53.764865Z",
     "shell.execute_reply": "2024-01-30T19:36:53.762905Z"
    },
    "papermill": {
     "duration": 0.044486,
     "end_time": "2024-01-30T19:36:53.767463",
     "exception": false,
     "start_time": "2024-01-30T19:36:53.722977",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 10</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>status</th><th scope=col>bed</th><th scope=col>bath</th><th scope=col>acre_lot</th><th scope=col>city</th><th scope=col>state</th><th scope=col>zip_code</th><th scope=col>house_size</th><th scope=col>prev_sold_date</th><th scope=col>price</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>for_sale</td><td>3</td><td>2</td><td>0.12</td><td>Adjuntas     </td><td>Puerto Rico</td><td>601</td><td> 920</td><td></td><td>105000</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>for_sale</td><td>4</td><td>2</td><td>0.08</td><td>Adjuntas     </td><td>Puerto Rico</td><td>601</td><td>1527</td><td></td><td> 80000</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>for_sale</td><td>2</td><td>1</td><td>0.15</td><td>Juana Diaz   </td><td>Puerto Rico</td><td>795</td><td> 748</td><td></td><td> 67000</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>for_sale</td><td>4</td><td>2</td><td>0.10</td><td>Ponce        </td><td>Puerto Rico</td><td>731</td><td>1800</td><td></td><td>145000</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>for_sale</td><td>6</td><td>2</td><td>0.05</td><td>Mayaguez     </td><td>Puerto Rico</td><td>680</td><td>  NA</td><td></td><td> 65000</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>for_sale</td><td>4</td><td>3</td><td>0.46</td><td>San Sebastian</td><td>Puerto Rico</td><td>612</td><td>2520</td><td></td><td>179000</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 10\n",
       "\\begin{tabular}{r|llllllllll}\n",
       "  & status & bed & bath & acre\\_lot & city & state & zip\\_code & house\\_size & prev\\_sold\\_date & price\\\\\n",
       "  & <chr> & <dbl> & <dbl> & <dbl> & <chr> & <chr> & <dbl> & <dbl> & <chr> & <dbl>\\\\\n",
       "\\hline\n",
       "\t1 & for\\_sale & 3 & 2 & 0.12 & Adjuntas      & Puerto Rico & 601 &  920 &  & 105000\\\\\n",
       "\t2 & for\\_sale & 4 & 2 & 0.08 & Adjuntas      & Puerto Rico & 601 & 1527 &  &  80000\\\\\n",
       "\t3 & for\\_sale & 2 & 1 & 0.15 & Juana Diaz    & Puerto Rico & 795 &  748 &  &  67000\\\\\n",
       "\t4 & for\\_sale & 4 & 2 & 0.10 & Ponce         & Puerto Rico & 731 & 1800 &  & 145000\\\\\n",
       "\t5 & for\\_sale & 6 & 2 & 0.05 & Mayaguez      & Puerto Rico & 680 &   NA &  &  65000\\\\\n",
       "\t6 & for\\_sale & 4 & 3 & 0.46 & San Sebastian & Puerto Rico & 612 & 2520 &  & 179000\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 10\n",
       "\n",
       "| <!--/--> | status &lt;chr&gt; | bed &lt;dbl&gt; | bath &lt;dbl&gt; | acre_lot &lt;dbl&gt; | city &lt;chr&gt; | state &lt;chr&gt; | zip_code &lt;dbl&gt; | house_size &lt;dbl&gt; | prev_sold_date &lt;chr&gt; | price &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | for_sale | 3 | 2 | 0.12 | Adjuntas      | Puerto Rico | 601 |  920 | <!----> | 105000 |\n",
       "| 2 | for_sale | 4 | 2 | 0.08 | Adjuntas      | Puerto Rico | 601 | 1527 | <!----> |  80000 |\n",
       "| 3 | for_sale | 2 | 1 | 0.15 | Juana Diaz    | Puerto Rico | 795 |  748 | <!----> |  67000 |\n",
       "| 4 | for_sale | 4 | 2 | 0.10 | Ponce         | Puerto Rico | 731 | 1800 | <!----> | 145000 |\n",
       "| 5 | for_sale | 6 | 2 | 0.05 | Mayaguez      | Puerto Rico | 680 |   NA | <!----> |  65000 |\n",
       "| 6 | for_sale | 4 | 3 | 0.46 | San Sebastian | Puerto Rico | 612 | 2520 | <!----> | 179000 |\n",
       "\n"
      ],
      "text/plain": [
       "  status   bed bath acre_lot city          state       zip_code house_size\n",
       "1 for_sale 3   2    0.12     Adjuntas      Puerto Rico 601       920      \n",
       "2 for_sale 4   2    0.08     Adjuntas      Puerto Rico 601      1527      \n",
       "3 for_sale 2   1    0.15     Juana Diaz    Puerto Rico 795       748      \n",
       "4 for_sale 4   2    0.10     Ponce         Puerto Rico 731      1800      \n",
       "5 for_sale 6   2    0.05     Mayaguez      Puerto Rico 680        NA      \n",
       "6 for_sale 4   3    0.46     San Sebastian Puerto Rico 612      2520      \n",
       "  prev_sold_date price \n",
       "1                105000\n",
       "2                 80000\n",
       "3                 67000\n",
       "4                145000\n",
       "5                 65000\n",
       "6                179000"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#the headset\n",
    "head(df)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "f73a74ba",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-01-30T19:36:53.780685Z",
     "iopub.status.busy": "2024-01-30T19:36:53.779091Z",
     "iopub.status.idle": "2024-01-30T19:36:54.484076Z",
     "shell.execute_reply": "2024-01-30T19:36:54.482241Z"
    },
    "papermill": {
     "duration": 0.715194,
     "end_time": "2024-01-30T19:36:54.487472",
     "exception": false,
     "start_time": "2024-01-30T19:36:53.772278",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "    status               bed              bath           acre_lot       \n",
       " Length:1401066     Min.   :  1.00   Min.   :  1.00   Min.   :     0.0  \n",
       " Class :character   1st Qu.:  2.00   1st Qu.:  2.00   1st Qu.:     0.1  \n",
       " Mode  :character   Median :  3.00   Median :  2.00   Median :     0.3  \n",
       "                    Mean   :  3.39   Mean   :  2.49   Mean   :    32.2  \n",
       "                    3rd Qu.:  4.00   3rd Qu.:  3.00   3rd Qu.:     1.3  \n",
       "                    Max.   :123.00   Max.   :198.00   Max.   :100000.0  \n",
       "                    NA's   :216528   NA's   :194213   NA's   :357467    \n",
       "     city              state              zip_code       house_size     \n",
       " Length:1401066     Length:1401066     Min.   :  601   Min.   :      4  \n",
       " Class :character   Class :character   1st Qu.: 5652   1st Qu.:   1170  \n",
       " Mode  :character   Mode  :character   Median : 8757   Median :   1700  \n",
       "                                       Mean   : 8357   Mean   :   2179  \n",
       "                                       3rd Qu.:11426   3rd Qu.:   2500  \n",
       "                                       Max.   :99999   Max.   :1450112  \n",
       "                                       NA's   :479     NA's   :450112   \n",
       " prev_sold_date         price          \n",
       " Length:1401066     Min.   :        0  \n",
       " Class :character   1st Qu.:   235000  \n",
       " Mode  :character   Median :   446777  \n",
       "                    Mean   :   818603  \n",
       "                    3rd Qu.:   795000  \n",
       "                    Max.   :875000000  \n",
       "                    NA's   :108        "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#check summary\n",
    "summary(df)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "c34b976e",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-01-30T19:36:54.500860Z",
     "iopub.status.busy": "2024-01-30T19:36:54.499281Z",
     "iopub.status.idle": "2024-01-30T19:36:54.518878Z",
     "shell.execute_reply": "2024-01-30T19:36:54.517010Z"
    },
    "papermill": {
     "duration": 0.028954,
     "end_time": "2024-01-30T19:36:54.521361",
     "exception": false,
     "start_time": "2024-01-30T19:36:54.492407",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'status'</li><li>'bed'</li><li>'bath'</li><li>'acre_lot'</li><li>'city'</li><li>'state'</li><li>'zip_code'</li><li>'house_size'</li><li>'prev_sold_date'</li><li>'price'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'status'\n",
       "\\item 'bed'\n",
       "\\item 'bath'\n",
       "\\item 'acre\\_lot'\n",
       "\\item 'city'\n",
       "\\item 'state'\n",
       "\\item 'zip\\_code'\n",
       "\\item 'house\\_size'\n",
       "\\item 'prev\\_sold\\_date'\n",
       "\\item 'price'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'status'\n",
       "2. 'bed'\n",
       "3. 'bath'\n",
       "4. 'acre_lot'\n",
       "5. 'city'\n",
       "6. 'state'\n",
       "7. 'zip_code'\n",
       "8. 'house_size'\n",
       "9. 'prev_sold_date'\n",
       "10. 'price'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] \"status\"         \"bed\"            \"bath\"           \"acre_lot\"      \n",
       " [5] \"city\"           \"state\"          \"zip_code\"       \"house_size\"    \n",
       " [9] \"prev_sold_date\" \"price\"         "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#check columns name\n",
    "colnames(df)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "24cd2c45",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-01-30T19:36:54.534880Z",
     "iopub.status.busy": "2024-01-30T19:36:54.533288Z",
     "iopub.status.idle": "2024-01-30T19:37:07.389032Z",
     "shell.execute_reply": "2024-01-30T19:37:07.386754Z"
    },
    "papermill": {
     "duration": 12.865847,
     "end_time": "2024-01-30T19:37:07.392178",
     "exception": false,
     "start_time": "2024-01-30T19:36:54.526331",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      ".\n",
      "  FALSE    TRUE \n",
      " 152040 1249026 \n"
     ]
    }
   ],
   "source": [
    "#check for duplicates \n",
    "duplicates <- df%>%duplicated()\n",
    "dupli_df <- duplicates%>%table()\n",
    "print(dupli_df)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "023b839d",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-01-30T19:37:07.407010Z",
     "iopub.status.busy": "2024-01-30T19:37:07.405158Z",
     "iopub.status.idle": "2024-01-30T19:37:07.496713Z",
     "shell.execute_reply": "2024-01-30T19:37:07.494746Z"
    },
    "papermill": {
     "duration": 0.102115,
     "end_time": "2024-01-30T19:37:07.499295",
     "exception": false,
     "start_time": "2024-01-30T19:37:07.397180",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 1 × 10</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>status</th><th scope=col>bed</th><th scope=col>bath</th><th scope=col>acre_lot</th><th scope=col>city</th><th scope=col>state</th><th scope=col>zip_code</th><th scope=col>house_size</th><th scope=col>prev_sold_date</th><th scope=col>price</th></tr>\n",
       "\t<tr><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>0</td><td>216528</td><td>194213</td><td>357467</td><td>0</td><td>0</td><td>479</td><td>450112</td><td>0</td><td>108</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 1 × 10\n",
       "\\begin{tabular}{llllllllll}\n",
       " status & bed & bath & acre\\_lot & city & state & zip\\_code & house\\_size & prev\\_sold\\_date & price\\\\\n",
       " <int> & <int> & <int> & <int> & <int> & <int> & <int> & <int> & <int> & <int>\\\\\n",
       "\\hline\n",
       "\t 0 & 216528 & 194213 & 357467 & 0 & 0 & 479 & 450112 & 0 & 108\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 1 × 10\n",
       "\n",
       "| status &lt;int&gt; | bed &lt;int&gt; | bath &lt;int&gt; | acre_lot &lt;int&gt; | city &lt;int&gt; | state &lt;int&gt; | zip_code &lt;int&gt; | house_size &lt;int&gt; | prev_sold_date &lt;int&gt; | price &lt;int&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|\n",
       "| 0 | 216528 | 194213 | 357467 | 0 | 0 | 479 | 450112 | 0 | 108 |\n",
       "\n"
      ],
      "text/plain": [
       "  status bed    bath   acre_lot city state zip_code house_size prev_sold_date\n",
       "1 0      216528 194213 357467   0    0     479      450112     0             \n",
       "  price\n",
       "1 108  "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#Check for null values\n",
    "df%>%summarise_all(~sum(is.na(.)))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "32848e73",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-01-30T19:37:07.513956Z",
     "iopub.status.busy": "2024-01-30T19:37:07.512141Z",
     "iopub.status.idle": "2024-01-30T19:37:08.199807Z",
     "shell.execute_reply": "2024-01-30T19:37:08.198012Z"
    },
    "papermill": {
     "duration": 0.698808,
     "end_time": "2024-01-30T19:37:08.203327",
     "exception": false,
     "start_time": "2024-01-30T19:37:07.504519",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "#delete rows where the house price is null\n",
    "df <- df%>%filter(!is.na(price))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "id": "8d952500",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-01-30T19:37:08.218143Z",
     "iopub.status.busy": "2024-01-30T19:37:08.216374Z",
     "iopub.status.idle": "2024-01-30T19:37:08.287943Z",
     "shell.execute_reply": "2024-01-30T19:37:08.286146Z"
    },
    "papermill": {
     "duration": 0.08166,
     "end_time": "2024-01-30T19:37:08.290414",
     "exception": false,
     "start_time": "2024-01-30T19:37:08.208754",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 1 × 10</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>status</th><th scope=col>bed</th><th scope=col>bath</th><th scope=col>acre_lot</th><th scope=col>city</th><th scope=col>state</th><th scope=col>zip_code</th><th scope=col>house_size</th><th scope=col>prev_sold_date</th><th scope=col>price</th></tr>\n",
       "\t<tr><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>0</td><td>216491</td><td>194105</td><td>357359</td><td>0</td><td>0</td><td>444</td><td>450077</td><td>0</td><td>0</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 1 × 10\n",
       "\\begin{tabular}{llllllllll}\n",
       " status & bed & bath & acre\\_lot & city & state & zip\\_code & house\\_size & prev\\_sold\\_date & price\\\\\n",
       " <int> & <int> & <int> & <int> & <int> & <int> & <int> & <int> & <int> & <int>\\\\\n",
       "\\hline\n",
       "\t 0 & 216491 & 194105 & 357359 & 0 & 0 & 444 & 450077 & 0 & 0\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 1 × 10\n",
       "\n",
       "| status &lt;int&gt; | bed &lt;int&gt; | bath &lt;int&gt; | acre_lot &lt;int&gt; | city &lt;int&gt; | state &lt;int&gt; | zip_code &lt;int&gt; | house_size &lt;int&gt; | prev_sold_date &lt;int&gt; | price &lt;int&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|\n",
       "| 0 | 216491 | 194105 | 357359 | 0 | 0 | 444 | 450077 | 0 | 0 |\n",
       "\n"
      ],
      "text/plain": [
       "  status bed    bath   acre_lot city state zip_code house_size prev_sold_date\n",
       "1 0      216491 194105 357359   0    0     444      450077     0             \n",
       "  price\n",
       "1 0    "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "#Check for null values\n",
    "df%>%summarise_all(~sum(is.na(.)))"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "766b5221",
   "metadata": {
    "papermill": {
     "duration": 0.00541,
     "end_time": "2024-01-30T19:37:08.301233",
     "exception": false,
     "start_time": "2024-01-30T19:37:08.295823",
     "status": "completed"
    },
    "tags": []
   },
   "source": []
  },
  {
   "cell_type": "code",
   "execution_count": 11,
   "id": "754fe0da",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-01-30T19:37:08.316395Z",
     "iopub.status.busy": "2024-01-30T19:37:08.313912Z",
     "iopub.status.idle": "2024-01-30T19:37:10.786825Z",
     "shell.execute_reply": "2024-01-30T19:37:10.784884Z"
    },
    "papermill": {
     "duration": 2.483664,
     "end_time": "2024-01-30T19:37:10.790156",
     "exception": false,
     "start_time": "2024-01-30T19:37:08.306492",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "system(\"apt-get install -y git\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 12,
   "id": "a358f9d7",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-01-30T19:37:10.804518Z",
     "iopub.status.busy": "2024-01-30T19:37:10.802968Z",
     "iopub.status.idle": "2024-01-30T19:37:21.820727Z",
     "shell.execute_reply": "2024-01-30T19:37:21.817738Z"
    },
    "papermill": {
     "duration": 11.028942,
     "end_time": "2024-01-30T19:37:21.824441",
     "exception": false,
     "start_time": "2024-01-30T19:37:10.795499",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# Clone a Git repository\n",
    "system(\"git clone https://github.com/KimKarydas/House-Price-Prediction.git\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 13,
   "id": "c08904c7",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-01-30T19:37:21.840656Z",
     "iopub.status.busy": "2024-01-30T19:37:21.838281Z",
     "iopub.status.idle": "2024-01-30T19:37:21.869373Z",
     "shell.execute_reply": "2024-01-30T19:37:21.867460Z"
    },
    "papermill": {
     "duration": 0.041843,
     "end_time": "2024-01-30T19:37:21.871994",
     "exception": false,
     "start_time": "2024-01-30T19:37:21.830151",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# Stage changes\n",
    "system(\"git add .\")\n",
    "\n",
    "# Commit changes\n",
    "system(\"git commit -m 'Commit cleaning'\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 14,
   "id": "a3a25389",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-01-30T19:37:21.886680Z",
     "iopub.status.busy": "2024-01-30T19:37:21.885001Z",
     "iopub.status.idle": "2024-01-30T19:37:21.902484Z",
     "shell.execute_reply": "2024-01-30T19:37:21.900651Z"
    },
    "papermill": {
     "duration": 0.027753,
     "end_time": "2024-01-30T19:37:21.905189",
     "exception": false,
     "start_time": "2024-01-30T19:37:21.877436",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "system(\"git status\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 15,
   "id": "1046d665",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-01-30T19:37:21.925083Z",
     "iopub.status.busy": "2024-01-30T19:37:21.923439Z",
     "iopub.status.idle": "2024-01-30T19:37:21.944617Z",
     "shell.execute_reply": "2024-01-30T19:37:21.942251Z"
    },
    "papermill": {
     "duration": 0.034572,
     "end_time": "2024-01-30T19:37:21.947774",
     "exception": false,
     "start_time": "2024-01-30T19:37:21.913202",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "'/kaggle/working'"
      ],
      "text/latex": [
       "'/kaggle/working'"
      ],
      "text/markdown": [
       "'/kaggle/working'"
      ],
      "text/plain": [
       "[1] \"/kaggle/working\""
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "getwd()\n"
   ]
  }
 ],
 "metadata": {
  "kaggle": {
   "accelerator": "none",
   "dataSources": [
    {
     "datasetId": 3202774,
     "sourceId": 7226569,
     "sourceType": "datasetVersion"
    }
   ],
   "dockerImageVersionId": 30618,
   "isGpuEnabled": false,
   "isInternetEnabled": true,
   "language": "r",
   "sourceType": "notebook"
  },
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "4.0.5"
  },
  "papermill": {
   "default_parameters": {},
   "duration": 41.079118,
   "end_time": "2024-01-30T19:37:22.177374",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2024-01-30T19:36:41.098256",
   "version": "2.5.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}

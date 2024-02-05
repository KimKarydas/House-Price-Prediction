{
 "cells": [
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "37d52b7e",
   "metadata": {
    "_execution_state": "idle",
    "_uuid": "051d70d956493feee0c6d64651c6a088724dca2a",
    "execution": {
     "iopub.execute_input": "2024-02-05T20:11:56.383934Z",
     "iopub.status.busy": "2024-02-05T20:11:56.381268Z",
     "iopub.status.idle": "2024-02-05T20:11:57.772220Z",
     "shell.execute_reply": "2024-02-05T20:11:57.770244Z"
    },
    "papermill": {
     "duration": 1.403765,
     "end_time": "2024-02-05T20:11:57.775015",
     "exception": false,
     "start_time": "2024-02-05T20:11:56.371250",
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
   "id": "36011126",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-02-05T20:11:57.824859Z",
     "iopub.status.busy": "2024-02-05T20:11:57.791715Z",
     "iopub.status.idle": "2024-02-05T20:12:32.627848Z",
     "shell.execute_reply": "2024-02-05T20:12:32.625365Z"
    },
    "papermill": {
     "duration": 34.849321,
     "end_time": "2024-02-05T20:12:32.631548",
     "exception": false,
     "start_time": "2024-02-05T20:11:57.782227",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Installing package into ‘/usr/local/lib/R/site-library’\n",
      "(as ‘lib’ is unspecified)\n",
      "\n"
     ]
    }
   ],
   "source": [
    "install.packages(\"ggplot2\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "d572e0e1",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-02-05T20:12:32.651192Z",
     "iopub.status.busy": "2024-02-05T20:12:32.649165Z",
     "iopub.status.idle": "2024-02-05T20:12:32.829696Z",
     "shell.execute_reply": "2024-02-05T20:12:32.827183Z"
    },
    "papermill": {
     "duration": 0.193941,
     "end_time": "2024-02-05T20:12:32.833231",
     "exception": false,
     "start_time": "2024-02-05T20:12:32.639290",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\n",
      "Attaching package: ‘data.table’\n",
      "\n",
      "\n",
      "The following objects are masked from ‘package:lubridate’:\n",
      "\n",
      "    hour, isoweek, mday, minute, month, quarter, second, wday, week,\n",
      "    yday, year\n",
      "\n",
      "\n",
      "The following objects are masked from ‘package:dplyr’:\n",
      "\n",
      "    between, first, last\n",
      "\n",
      "\n",
      "The following object is masked from ‘package:purrr’:\n",
      "\n",
      "    transpose\n",
      "\n",
      "\n"
     ]
    }
   ],
   "source": [
    "#Libraries\n",
    "library(dplyr)\n",
    "library(data.table)\n",
    "library(ggplot2)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "409bbf3d",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-02-05T20:12:32.853381Z",
     "iopub.status.busy": "2024-02-05T20:12:32.851383Z",
     "iopub.status.idle": "2024-02-05T20:12:41.572041Z",
     "shell.execute_reply": "2024-02-05T20:12:41.569776Z"
    },
    "papermill": {
     "duration": 8.734118,
     "end_time": "2024-02-05T20:12:41.574941",
     "exception": false,
     "start_time": "2024-02-05T20:12:32.840823",
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
   "execution_count": 5,
   "id": "73bd6391",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-02-05T20:12:41.594477Z",
     "iopub.status.busy": "2024-02-05T20:12:41.592666Z",
     "iopub.status.idle": "2024-02-05T20:12:41.636637Z",
     "shell.execute_reply": "2024-02-05T20:12:41.633731Z"
    },
    "papermill": {
     "duration": 0.057425,
     "end_time": "2024-02-05T20:12:41.640205",
     "exception": false,
     "start_time": "2024-02-05T20:12:41.582780",
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
   "execution_count": 6,
   "id": "cefdc808",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-02-05T20:12:41.661365Z",
     "iopub.status.busy": "2024-02-05T20:12:41.659375Z",
     "iopub.status.idle": "2024-02-05T20:12:42.479114Z",
     "shell.execute_reply": "2024-02-05T20:12:42.476583Z"
    },
    "papermill": {
     "duration": 0.834427,
     "end_time": "2024-02-05T20:12:42.482464",
     "exception": false,
     "start_time": "2024-02-05T20:12:41.648037",
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
   "execution_count": 7,
   "id": "a0fd2905",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-02-05T20:12:42.502228Z",
     "iopub.status.busy": "2024-02-05T20:12:42.500576Z",
     "iopub.status.idle": "2024-02-05T20:12:42.523256Z",
     "shell.execute_reply": "2024-02-05T20:12:42.520377Z"
    },
    "papermill": {
     "duration": 0.036388,
     "end_time": "2024-02-05T20:12:42.526859",
     "exception": false,
     "start_time": "2024-02-05T20:12:42.490471",
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
   "execution_count": 8,
   "id": "406f53c1",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-02-05T20:12:42.547691Z",
     "iopub.status.busy": "2024-02-05T20:12:42.546004Z",
     "iopub.status.idle": "2024-02-05T20:12:59.461699Z",
     "shell.execute_reply": "2024-02-05T20:12:59.458868Z"
    },
    "papermill": {
     "duration": 16.930681,
     "end_time": "2024-02-05T20:12:59.465901",
     "exception": false,
     "start_time": "2024-02-05T20:12:42.535220",
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
   "execution_count": 9,
   "id": "78af4507",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-02-05T20:12:59.487927Z",
     "iopub.status.busy": "2024-02-05T20:12:59.486046Z",
     "iopub.status.idle": "2024-02-05T20:12:59.585451Z",
     "shell.execute_reply": "2024-02-05T20:12:59.582585Z"
    },
    "papermill": {
     "duration": 0.113854,
     "end_time": "2024-02-05T20:12:59.588827",
     "exception": false,
     "start_time": "2024-02-05T20:12:59.474973",
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
   "execution_count": 10,
   "id": "fc61c5fc",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-02-05T20:12:59.610583Z",
     "iopub.status.busy": "2024-02-05T20:12:59.608704Z",
     "iopub.status.idle": "2024-02-05T20:12:59.738606Z",
     "shell.execute_reply": "2024-02-05T20:12:59.736263Z"
    },
    "papermill": {
     "duration": 0.144788,
     "end_time": "2024-02-05T20:12:59.742226",
     "exception": false,
     "start_time": "2024-02-05T20:12:59.597438",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "#delete rows where the house price is null\n",
    "df <- df%>%filter(!is.na(df$price) & !is.na(zip_code))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 11,
   "id": "83ff1f96",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-02-05T20:12:59.764356Z",
     "iopub.status.busy": "2024-02-05T20:12:59.762338Z",
     "iopub.status.idle": "2024-02-05T20:12:59.847262Z",
     "shell.execute_reply": "2024-02-05T20:12:59.844384Z"
    },
    "papermill": {
     "duration": 0.099324,
     "end_time": "2024-02-05T20:12:59.850220",
     "exception": false,
     "start_time": "2024-02-05T20:12:59.750896",
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
       "\t<tr><td>0</td><td>216179</td><td>193825</td><td>357321</td><td>0</td><td>0</td><td>0</td><td>449785</td><td>0</td><td>0</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 1 × 10\n",
       "\\begin{tabular}{llllllllll}\n",
       " status & bed & bath & acre\\_lot & city & state & zip\\_code & house\\_size & prev\\_sold\\_date & price\\\\\n",
       " <int> & <int> & <int> & <int> & <int> & <int> & <int> & <int> & <int> & <int>\\\\\n",
       "\\hline\n",
       "\t 0 & 216179 & 193825 & 357321 & 0 & 0 & 0 & 449785 & 0 & 0\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 1 × 10\n",
       "\n",
       "| status &lt;int&gt; | bed &lt;int&gt; | bath &lt;int&gt; | acre_lot &lt;int&gt; | city &lt;int&gt; | state &lt;int&gt; | zip_code &lt;int&gt; | house_size &lt;int&gt; | prev_sold_date &lt;int&gt; | price &lt;int&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|\n",
       "| 0 | 216179 | 193825 | 357321 | 0 | 0 | 0 | 449785 | 0 | 0 |\n",
       "\n"
      ],
      "text/plain": [
       "  status bed    bath   acre_lot city state zip_code house_size prev_sold_date\n",
       "1 0      216179 193825 357321   0    0     0        449785     0             \n",
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
   "cell_type": "code",
   "execution_count": 12,
   "id": "1b8568ef",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-02-05T20:12:59.872793Z",
     "iopub.status.busy": "2024-02-05T20:12:59.870813Z",
     "iopub.status.idle": "2024-02-05T20:13:00.177314Z",
     "shell.execute_reply": "2024-02-05T20:13:00.174282Z"
    },
    "papermill": {
     "duration": 0.322184,
     "end_time": "2024-02-05T20:13:00.181257",
     "exception": false,
     "start_time": "2024-02-05T20:12:59.859073",
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
       "\t<tr><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>0</td><td>449785</td><td>0</td><td>0</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 1 × 10\n",
       "\\begin{tabular}{llllllllll}\n",
       " status & bed & bath & acre\\_lot & city & state & zip\\_code & house\\_size & prev\\_sold\\_date & price\\\\\n",
       " <int> & <int> & <int> & <int> & <int> & <int> & <int> & <int> & <int> & <int>\\\\\n",
       "\\hline\n",
       "\t 0 & 0 & 0 & 0 & 0 & 0 & 0 & 449785 & 0 & 0\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 1 × 10\n",
       "\n",
       "| status &lt;int&gt; | bed &lt;int&gt; | bath &lt;int&gt; | acre_lot &lt;int&gt; | city &lt;int&gt; | state &lt;int&gt; | zip_code &lt;int&gt; | house_size &lt;int&gt; | prev_sold_date &lt;int&gt; | price &lt;int&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|\n",
       "| 0 | 0 | 0 | 0 | 0 | 0 | 0 | 449785 | 0 | 0 |\n",
       "\n"
      ],
      "text/plain": [
       "  status bed bath acre_lot city state zip_code house_size prev_sold_date price\n",
       "1 0      0   0    0        0    0     0        449785     0              0    "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "df <- df %>% mutate_at(vars(bed, bath, acre_lot), ~ifelse(is.na(.), 0, .))\n",
    "df%>%summarise_all(~sum(is.na(.)))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 13,
   "id": "4392f6d8",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-02-05T20:13:00.204533Z",
     "iopub.status.busy": "2024-02-05T20:13:00.202543Z",
     "iopub.status.idle": "2024-02-05T20:13:01.713788Z",
     "shell.execute_reply": "2024-02-05T20:13:01.711556Z"
    },
    "papermill": {
     "duration": 1.525957,
     "end_time": "2024-02-05T20:13:01.716444",
     "exception": false,
     "start_time": "2024-02-05T20:13:00.190487",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\nteXz+dE58XK5nMvlWlpaajUGr7EDAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiE\nsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCI\nhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMA\niISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLAD\nAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISw\nAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiE\nsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCI\nhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIhE3dCc\nptD+yKUXXnbXX+d1lOs22mKnwz50/C4btoQQQijfdtXF199x35NLslttM+uoE4/epDH74k4V\nVoUBbNPfqoEcFgBg5BmaR+zSiz/xubvmTz7hs1/4ypmf3Dr70FdOOXV+bzmEMO/az55/9V27\nHHzsGScd0fTPW077xKXpi/tUWBUGsE1/qwZyWACAkWgowq6n7Te3Pt957FnH77LtlpvP3OmY\nU/+r1P3vq5/vDGnhvKsfmn74OYfus8vM18w+6csnLH3qhh890xFCqLRquTXYfSCHBQAYmYYi\n7DJ1E4855phZrfllXyd1IYSmbKan7Y5/d5cO2GtK3+L68bO3b8nfc/tzIYQKq5Zbg90HclgA\ngBFqKF5jl2vebs6c7UIIi+6/+8/PPX/vr65ed+bbDl+vqevpB0IIWze9NIaZTXU3/a0thFDo\n6HfVchW26W9VYfaqD7uitra2YrG4htMesFKpNH/+/GqfZXgatRMPISxYsKDWQ6iNQZ94a2tr\nPp9f9XYjSqFQaG9vr/UoBk1bW7/fZqPX0dHR0TEanxcqFoujc+IhhO7u7u7u7uodP5vNjh8/\nvr+1Q/TmiT7P3XHzzx996t//6dr9kE2TEMo9HSGEibmX3rswMZctthdDxVXLrcHuAzksAMAI\nNaRhN+PEz54XwtIn//DhE7909tStT96iKYSwsFielF/2jPD8YqlufF0IIVPf76rlKmzT36qB\nHHZFjY2N9fX1gzT7lSgUCoVCIZPJNDU1Ve8sw1Nvb2+hUBiFEy+VSl1dXSGE5ubmJElqPZwh\nVS6XOzs7B33i2WyEb2zPZrMtLS21HsXg6OjoaGhoiPJuqqyjoyNN03w+H98jyqvU1dVVV1eX\ny+VqPZCh1tXVVSqVcrlcVeOh8rfQoQi79sd++9t/1r/lTTv3fdky7fVvXafhl7c8k9th2xBu\nf7irOCm/bP6PdPWOnTk2hJBr6nfVchW26W/VQA67omr/ayyXy4VCIUmShoaGqp5oGCoUCsVi\ncXROvC/sGhoaRlvYlUqlzs7OUTjxNZDNZqMpoY6Ojnw+Pwp/xvc9EZnL5UbhN7qenp66urrR\nOfFSqZTNZms496F480Sx6/bvXHL+/GJ52ddp7987e5s2bG4Yt+fUfPaGO19YttnS++5dUthp\nz0khhAqrlluD3QdyWACAEWoowm78jA9ukus59Yvfve9vjzz24F+uuvCTD3Q1vu9dG4ckd/Kh\nMx797pm33vfI0/P+etnp5zVP3ffwKc0hhAqr5l3zw+9fcV3lbfpdVWEXAIARLknTofiA3o4n\n/3jRd668/x9PdqW5jTbfcc5Rx71xi7EhhJCWbv6fC66++Y8LupPNtt/juJOPnb78Lav9rPrt\n8e89f/56//fj89ds90q7DLnOzs7Ozs7Kb2+JVaFQ6OjoGJ0T73u34zrrrDPanpEslUqLFi2q\n0sSvC9cdFA4a9MMOvblh7pwwp9ajGEwLFixobW0dhU/FLliwIE3T5ubmxsbGWo9lqLW1teXz\n+dE58b5XGdXwNbJDFHaD63sf+eIx3/p0rUcxCITd6Jy4sBN2FQi7aAi70Tnxmofd0PxJscH0\n7O9//uhWb6r1KAAAhp2aPQu5xsZsuNMXdptS61EAAAw7Iy/smqepOgCAlRh5T8UCALBSwg4A\nIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIO\nACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLC\nDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACAS\nwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAg\nEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4A\nIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIO\nACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLC\nDgAgEnW1HsCw1tvbm6Zp9Y5fLpdDCGmaFovF6p1leCqVSqN24n3/UywWkySp7WCGWN8FP+gT\nz2azmUxsv6OWy+Xll0oEent7az2EmimVSqPwG12apqN24iGEcrlc7bnncrn+Vgm7Sjo7O4fg\nuiyXy+3t7dU+y/A0aiceQliyZEmthzDU+r7lDfrEx4wZk8/nB/eYNdfb2xvNFZKmaWdnZ61H\nUQN9F3x3d3dPT0+txzLU0jTt7e0dnRMPIRSLxarGQzabHTduXH9rhV0lra2tVT1+Z2dnZ2dn\nNpsdP358VU80DBUKhY6OjtE58b6cnTBhwmh7xK5UKi1atGgUTnwN5PP5ddZZp9ajGBwLFixo\nbW2t8ABDrBYsWJCmaXNzc2NjY63HMtTa2try+fzonHixWKyvr29paanVGGJ7/gIAYNQSdgAA\nkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACRqKv1\nAAAgQmPGjAkhZLPZWg+E0UXYAcDgy+fztR4Co5GwA4CBeiY8c3e4u9ajGASzwqzJYXKtR8Hg\nE3YAMFB3h7sPCgfVehSDYG6YOyfMqfUoGHzePAEAEAlhBwAQCWEHABAJr7GDIVVXV9fa2hpC\nSJKk1mMBIDbCDoZUJpPxIQgAVImwg4HyMQcADHPCDgbKxxwAMMx58wQAQCSEHQBAJIQdAEAk\nhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBA\nJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0A\nQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhLwi1voAACAASURB\n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\nr1pWfubRB/61oPu1n/3W4I4JAIA1sHp/9fXlMtO23WvO3u/7ymmzBm04AACsqYGG3V133VXV\ncQAAsJa8Ng4AIBKr91Rs51P3X/PTmx+c93RnqW7ypjP3m3Poa6a1VGlkAACsltUIu2s/9673\nfuHHPeWX/nrYaScd947T/vfqzx9ShYEBALB6BvpU7OM/ee+hZ1+93h7HXH3z3U89v2DRC0/f\nc+s173/j+j8++9DD/++Jao4QAIABGegjdl876WctU496+JZLmzJJ35LX7nnIa/Y4oLzRpB9/\n9Ovh4G9WbYQAAAzIQB+xu+qFzi0++LHlVdcnyTR97CNbdr3woyoMDACA1TPQsGvJZLqf6371\n8u7nupOs908AANTeQMPupM3HPvY/x9+7qGfFhYW2+z5y2SNjp3+sCgMDAGD1DPQ1dkdf8/kz\nZn50t423P+YjR++23fSG0PXPv955+be+90hn/sKfHF3VIQIAMBADDbtxWx7/4M117zv+M5ec\ne+olLy6csOUbLrroB8fNGFelwQEAMHCr8Tl2G+z5wdseOvY/D//p7/98uifUT9l06522muYv\nVwAADBMDCrNH7775xieXhhBCSDaY8drddnx87i9ufuDheV0rfFgxAAC1tYqwa3/0+jk7Ttni\n9fud/+Ci5QuLHQ9c/u2vv//gN07Z/I0/+duiCrsDADBkKoVdof33r9v+kJ89sHDOh047ebt1\nli8ft+n59//uhs8dd2D3E799786vv7O9UP1xAgCwCpXC7jfHHfVod+/pN/5j7iXnvGly0/Ll\nSbZ1+90OOOvb1z3805N7ux89+sTfVX+cAACsQqWw+/ov/9My5aSz9tuovw02eetXPzFtzJM/\nv6AKAwMAYPVUCru72gvrvv7tlfd/+27r9bT9dlCHBADAmqgUdhPqMumq3vda6iolmcZBHRIA\nAGuiUtgdPLHx+bv+t+Lu6SW/f65hwgGDOyYAANZApbA79pM7djz73Q/95NH+Nnjge+/58Qud\nWx/30SoMDACA1VMp7GZ8+NpDNmm97N07HHP2/zy5tLjiquKSJ757+ntfd+zVzZP2v/bUbas8\nSAAAVq3SnxTL5CZe+efbjnvzW77/uSOv+PxHZ772NdM3WK8+KT7/n0fvvefv7b3lCdscev2v\n/2dafXbIhgsAQH9W8bdi82N3/N7v/nX0Ty7+5veu/s3tv/3rH3pDCJncmO13e+vBhx/38aP3\n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\nEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4A\nIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIO\nACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLC\nDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACAS\nwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAg\nEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4A\nIBLCDgAgEsIOACASwg4AIBJ1tR7A0CvfdtXF199x35NLslttM+uoE4/epDFb6yEBAAyCUfeI\n3bxrP3v+1XftcvCxZ5x0RNM/bzntE5emtR4SAMCgGGVhlxbOu/qh6Yefc+g+u8x8zeyTvnzC\n0qdu+NEzHbUeFgDAIBhdYdfTdse/u0sH7DWl78v68bO3b8nfc/tztR0VAMCgGF2vsSt0PBBC\n2LrppVnPbKq76W9t/W1/VDjqhHDCUIwshBDCzmHnEEKapmka//PD2Wy2paWlXC7XeiADkiRJ\nkiSzwqy5YW6txzIIZoVZoRZXWpIkra2tg35e984w19TUlMlkRso/9gpcaQPX1NSUJMlQ3umj\n7d7JZPp9YG50hV25pyOEMDH30rslJuayxfZif9vvkO6wQ7LDUIzsRWeFs85IzkiSZChPWj1n\nhbPOCGf0tzabHWFvW5kcJs8Jc2o9isFRqystn89X6cjunWHrK41fqfB9YMRxpQ1EheyoqtFz\n7zwZnpwWpq10VRLNL4UDseSpr7/3w7d/55rrJuWXXXNXfeBdv1rvk98/d6eVbt/T0zOEowsh\nhEwmk8lkSqXSEJ+3Skql0oirt5XKZrNpmkbwkMNymUwmSZI4rjT3zjDn+8CwFdOVFuW9E0JY\n6b2TJEmFX5JH1yN2uaZtQ7j94a7ipHx935JHunrHzhzb3/bVe3ShT1dXV2dnZzabHTdu3IrL\na/W7zqDL5XL9rSoUCp2dna+Y+DA3KD+cCoXCkiVLQggTJkyo+UMyQ3yllUqlxYsXV2niwzkd\n+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"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "#Histogram of Bed count distribution\n",
    "hist_bed <- ggplot(df, aes(x = bed)) +\n",
    "  geom_histogram(fill = \"green\", color = \"white\", bins = 300) +\n",
    "  labs(title = \"Histogram of Bed Counts\",\n",
    "       x = \"Number of Beds\",\n",
    "       y = \"Count\") +\n",
    "  theme_minimal() +\n",
    "  coord_cartesian(xlim = c(1, 5)) +\n",
    "  scale_y_continuous(labels = scales::comma)\n",
    "\n",
    "print(hist_bed)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 14,
   "id": "f7bea1d1",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-02-05T20:13:01.740143Z",
     "iopub.status.busy": "2024-02-05T20:13:01.738186Z",
     "iopub.status.idle": "2024-02-05T20:13:02.891513Z",
     "shell.execute_reply": "2024-02-05T20:13:02.889163Z"
    },
    "papermill": {
     "duration": 1.168564,
     "end_time": "2024-02-05T20:13:02.894669",
     "exception": false,
     "start_time": "2024-02-05T20:13:01.726105",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\ns/Z87du+ec3/vuAgN3/huC1mtKez+W32/uGzy4q/uuycN+y149RJTdnGSZtv/8rjz/jPR3qf\n/4V0pcK153/8wL12aW9o3nSb+adfcmv38utCCJNfct7A+sHCLkmKP/3aJ+bP27wpn2mdMmPP\nN7zrmnuWJUnyjaP2bm/Mtkybvap/dMOuoulsyPfYZfLNm8x96TGnfuOxvnWPOfQ0B7Z7wfW/\ngWGXJEmx9/HvfvE/Xv+qXTae1p7L5NqmbLTrgtd/4twfPNFXfPG2Q14zK+699pg37jmj7ZlY\nbJ294Ad/XXH49Obhht2LZzqgkpsoABNCKin7HVeMW8sff7S7mGw8a9N1vyxj5d9PnrL1oq0O\n/tXSa/at3dColv7OZf98pGvONrPX8+FnAPAeu4nr0lfvuNlmm52z9HnfYXvbOT8NIez+ke0G\n2YmJLdsybWtVB8DghN1EddiX3xBCWLT/sT/709KuQrFzxcOLz//QId9d0jD51d/Yc2atRwcA\n1ICXYieu5NKTDnr3+b8srXMGWzbd/ds///nbdhy1LxABACYQYTexPfnX31z1s5uXPrYy3zZ1\n+5ctWPiGvScN/28PAABxEHYAAJHwHjsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsA\ngEgIOwCASAi7Wurt7e3o6Fi9enWtB1IDhUKhbife0dHR0dFRh98NXiqV6nniHR0d/f39tR5L\nDaxatapuJ97R0dHX11frgdRAZ2dn3U68o6Oju7u7hmPwlyfKWbNmTVXvj0qlUqlUSqVSmUym\nepcyPiVJUiqV6nPixWIxhJDNZms9lrE2MPe6nXgIIZPJpFJ190f/+vv763biIYR0Op1O191z\nKMViMZVK1efEkySp9klPp9NtbW2Dra27e9hhaWhoyOVy1Tt+X19fb29vKpVqamqq3qWMT/39\n/b29vfU58YFf5hobG+vtoa5UKnV2dtbtxEMIDQ0NdfjLzJo1a+p24kmS5HK5fD5f67GMta6u\nrmw2W58TLxaLmUymsbGxepdS/i5U2JVT1aoLIQz8Ep9KpRoaGqp6QeNQKpXq6+urz4kPhF1D\nQ0O99U2xWOzs7KzbiYcQcrlcte9VxqE1a9bU7cRDCNlstg7v6Hp6eup24gNhV8O5193TpAAA\nsRJ2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYA\nAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2\nAACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACRyNZ6AFBfstlsW1tbCCGVStV6LADE\nRtjBmEqn0/l8vtajACBOwg7G1GOPFW6/vbPWoxhle+zRsskmuVqPAgBhB2Pr9ts7Dzlkaa1H\nMcoWL56zcOHkWo8CAB+eAACIhbADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiE\nsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCI\nhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMA\niISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIRA3CrndVR3cpGfvLBQCIW3aM\nL69nxe3HHfv5V33r+++b2RJCCKH0mysuuPaWux5endl+xz2OPvGYrZoyz25bZlWoYJvBVlVy\nWACAiWdMn7FLSj0XfuLcjmJp7ZKlV3/q3Ctvm3/ocWeedGTzP2487aMXJRWs2pDdKzksAMBE\nNKZh93+Xnfanttc893PSt+jK++Yecc7h+8+f97IFJ33xhDWPXPeDxzqHWLUhu1dyWACAiWns\nwm7V3xefc3336WcetnZJb8ctD/UUD9p31sCPDVMW7NKav+PmJ8qv2pDdKzksAMAENUbvsSv1\nPf6507934Cf+c+vm597Q1td5Twhhh+bnxjCvOfvLv3SUX7Uhu/ctGPqw6+ru7i4Wi8OebcX6\n+/tDCKVSac2aNdW7lPGpVCrV28QbGxuz2bF+V+tY6u/v7+npKbNBkiQhhM7OunuOfGDiIYTu\n7u7e3t7aDmbsJUlStxMPIfT29lb1cWR8KhaLdTvxEEKhUKjqo1s6nW5ubh5s7Rg9zPz8y59a\nvtsJ73nZ9KS4Yu3CUm9nCGF67rnUm57LFFYVyq/akN0rOey6+vr6CoVB146WJEnKPxxGrK4m\nns/naz2E6iqVSpWc0Lo66S/Q19dX6yHURt1OPITQ398/8Dt8vSmVSvU58RBCsVisatRmMpka\nh92Tf/jmJffOvPDS17xgebqhOYSwvFCamX/mFeGnC8XslGz5VRuyeyWHXVe1n18plUrFYjGV\n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\nACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHs\nAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh\n7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAi\nIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAA\nIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIiHsAAAiIewAACIh7AAAIpGt9QAYoSRJ\naj2EDTIw/ok+i2FJpVK1HkLVlT+hE/Sk18OJC1U+L0mSTLjzPlrqdu51O/EB1Z57mfslYVdO\nf39/rYewfn19fatWrar1KEbBsmXLaj2EsdPW1pbP52s9iiqq8Ga5fPnyMRjMKIr+xIXq36XE\ncX81Ml1dXV1dXbUeRQ0UCoX6nHgIoaenp6enp3rHz2QyU6ZMGWytsCsnmx2n108ulytzUieE\nQqHQ3d3d1tZW64GMnXQ68nc+DHmzLBaLq1atmjx58sR6Diz6ExeqfJeycuXK1tbWcXt3Wj0r\nV65MkqSpqamxsbHWYxlrq1evzuVy9Tnx/v7+hoaG5ubm6l1K+bvQuvufFodUKpXJZGo9ig1S\nLBZDCBN9FqyrwptlJpOZWGFXD6p9l5JOp+v2P3t9zj2VStXtxEOtH6Pj/00UAKBOCDsAgEgI\nOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBI\nCDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCA\nSAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsA\ngEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7\nAIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgI\nOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBI\nCDsAgEhkaz0AAIjQpEmTQgiZTKbWA6G+CDsAGH35fL7WQ6AeCTsAYvbYY4Xbb++s9ShG2R57\ntGyySa7Wo2A8Guuwu/T9RzV+5sK3bdT07ILSb6644Npb7np4dWb7Hfc4+sRjtmrKVLAqbMDu\nlRwWgEjcfnvnIYcsrfUoRtnixXMWLpxc61EwHo3lhyeSv//uksWPruxPkrWLll79qXOvvG3+\nocededKRzf+48bSPXpRUsGpDdq/ksAAAE9EYPWP3+G/P+9R//f7Jjt7nLU36Fl1539wjFh2+\n/1YhhLlfDG856ss/eOyId2zSUm7Vhuw+Mzf0YQEAJqYxesZu6s6Hn3Lm57/yxU+su7C345aH\neooH7Ttr4MeGKQt2ac3fcfMT5VdtyO6VHBYAYIIao2fs8u2bzW0Pxb7GdRf2dd4TQtih+bkx\nzGvO/vIvHeVXbcjufQuGPuy6isXi8OY5VgqFwpo1a2o9ig2SJEmSJCtWrKj1QMZOa2trLhfz\nm50rvFmuXLlyDAYziqI/caHKdylJkqxevTqVSlXp+GVEf+7G7WNBqVQqFos9PT21HshYK5VK\nIYTe3t5CoVC9S0mn0+3t7YOtreWnYku9nSGE6bnnPrswPZcprCqUX7Uhu1dy2HUlyTh9A16S\nJOM2OocljllUaNzenEZLhTfLCXfSoz9xofp3KQOPdmMv+nM3nh8Lor/yy6jteall2KUbmkMI\nywulmflnXhF+ulDMTsmWX7Uhu1dy2OddRHqc/mWOTCbT1NQ09HbjWLFYLBQKjY2NQ28ai+i/\np3TIm2WSJD09PRPuphv9iQtVvkvp7u5uaGioyd1p9Odu3D4W9Pb2ZjKZbLbuvlKtt7e3VCpl\ns9mqPlVc/n9TLa/0XPNOIdx8f3dhZr5hYMkD3f3t89rLr9qQ3Ss57LrGc9i1tEzsD3z09fUV\ni8WJPgvWNeTNcuClmebm5pq8KkcZVb1L6enpaWxsjPsl0VoZt48F/f39+Xx+fEZnVfX39w+E\nXQ3PSy3DpXHyPpvmM9fd+tTAj4U1d925um+3fWaWX7Uhu1dyWACACaqmz0ilcicfvt2Si8+6\n6a4HHl3652+fvqhl0wOOmNVSftXSq773ncuuGeHuZXYBAJjgavz699y3nvOB3vMuX3T6sp7U\nS3bZ++yTj0sNteqRm66/9ukZxxy1cGS7l9kFAGBCG9Owy+Q3+8lPfvK8RanMAUedfMBR69t6\nkFULLvj+kg9+fsS7l9sFAGAiG6cfDijj8d//dMn2r6v1KAAAxp2J91HkSZvv9tm9ZtV6FAAA\n487EC7uW2aoOAGA9Jt5LsQAArJewAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCI\nhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMA\niISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLAD\nAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISw\nAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiE\nsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCI\nhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIRLbWAxjXSqVSrYewfsVisa+vr9aj2CDF\nYjFJku7u7loPZOzk8/lMJlPrUVTRkDfLgf9QPT09YzWi0RH9iQvVv0vp7e3t7++v3vEHE/25\nG7ePBaVSqVAo1HoUNTBwL1csFqv66JZKpRobGwdbK+zKSZKk1kNYv1KpND7/M1cuSZIkSSb6\nLIYlm83G/Rgz5M1y4D/UhDvp0Z+4UOW7lCRJ+vv7i8VilY5fRvTnbtw+FpRKpYE7+VoPZKyt\nDbuqnpd0Oi3sRmjc3iPkcrn29vZaj2KD9PX1dXZ2TvRZsK4hb5bFYnHFihVtbW2pVGrMRkUl\nqnqXsmzZspaWllwuV6Xj17Nx+1jQ0dGRz+ebmppqPZCx1tHRUSgU8vl8a2trrcbgPXYAAJEQ\ndgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJHwJ8UAAEZBc3Nz\nkiTpdC2fNRN2AACjYDz8TWRhBwCMO489Vrj99s5aj2L07bFHyyabVLH/hB0AMO7cfnvnIYcs\nrfUoRt/ixXMWLpxcveP78AQAQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBA\nJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0A\nQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQd\nAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSE\nHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAk\nhB0AQCSEHQBAJIQdAEAkhB0AQCSEHQBAJIQdAEAksrUewNgr/eaKC6695a6HV2e233GPo088\nZqumTK2HBAAwCuruGbulV3/q3Ctvm3/ocWeedGTzP2487aMXJbUeEgDAqKizsEv6Fl1539wj\nzjl8//nzXrbgpC+esOaR637wWGethwUAMArqK+x6O255qKd40L6zBn5smLJgl9b8HTc/UdtR\nAQCMivp6j11f5z0hhB2an5v1vObsL//SMdj2Rx897YQTNhqLkVVs991bQghJkiTJxH4NOZPJ\ntLa2lkqlWg9k7KRSqVQqtcceLYsXz6n1WEbZHntUdLNMpVJtbW0T7tYb8YkLFZ+7DTFp0qR0\nOl2T/+wRn7sxOHEborm5OZVKjfikR3ziwiidu3R60Cfm6ivsSr2dIYTpuec+LTE9lymsKgy2\n/a67Nu26a/NYjGw4Pv3px848c5NUKlXrgWyoTGY9H1sZmN3YD2bMbLJJbuHCybUexeir8GaZ\nz+fHZjyjLtYTF6p/l1Lzkx7ruRvPjwVlsqNysZ64MBrn7uGH+2bPXv//rNT4jP0qWf3IV9/5\n/pv/66prZuafuc1d8Z63/WLGx7/zud3Wu31vb+8Yjq5S6XQ6nU4Xi8VaD6QqisXieoMvAplM\nJkmSWJ+kTKfTqVQqyptl3CcuOHcTlhM3cQ2E74jPXSqVKvP7Un09Y5dr3imEm+/vLszMNwws\neaC7v31e+2DbV/sXze7u7q6urkwmM3nysH8pGZXfh2qor6+vq6vrxRPP5XI1Gc+YKRaLq1ev\nDiFMnTp1fP6qvSHK3yyLxeLKlSsn6MQ35PeNgYmHENra2sbtLbx6dynLly+fNGlSDSdeq98V\nly9fniRJc3NzU1NT9S5lfD4WrFq1Kp/PNzY2bshBJuIv+atWrSoUCo2NjS0tLUNuXKUJ1lfY\nNU7eZ9P8t6679anXHLRZCKGw5q47V/cdvs/MwbYfs4efifg4t4EGply3Ew/PvomktoMZY2tP\nen1OPNTl3AfU7cRD3c+91kOomRrOfTyWfhWlcicfvt2Si8+66a4HHl3652+fvqhl0wOOmDV0\nVgMAjH/19YxdCGHuW8/5QO95ly86fVlP6iW77H32ycfV7y8UAEBc6i7sQipzwFEnH3BUrYcB\nADDa6uylWACAeAk7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCA\nSAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsA\ngEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEhkaz2AupbJZHK5XDpdj3mdSqWy2Xq8\n+aVSqVwuV+tR1Ebdzn3txFOpVK3HUgO5XK5uJ54kSSaTqfVAaiCbzdbtxEMItZ17KkmSGl48\nAACjpR6fKwIAiJKwAwCIhLADAIiEsAMAiISwAwCIhLAD4P+3d59hUVxrHMDfWZbdZemwIIqo\nVFEslCgqJCroRcVCLBFsGFRQSUwUFFSkiF2MirFiQ8V2bVFRY43lWhKM3RijEStFpQm7lN2d\n+2Flg8au7Mj6/32ac+bMOe/M87C8e2bnDABoCSR2AAAA1aWsqFCmxLJioDmf4gqxH5vVI4JF\nk5cEWuhxHQhUO1aevz1l6d6TFx6X8mrbOHYfONzPzYrroKB6lRddT0lefurS3yVKfn0n975h\nI1vXM+A6KNCQ0vwzw0Kmey9OC7PS5zoWqF45pyYOm36pak1Y6mZ/U5HmI0Fixy32xolV2x8U\n9MEy0Z+G/dMi110xDA4d1dha/+KhDYviw0t/TO1hg3/zWoxdNCY2w8AzPGaIhFdyZNOCWZHR\nKeuTJXzcLdF+rLJ0SdTcQoWS60BAEwrOF+iZd/tumIu6xk5fwEkkSOw4k318Xsyy/+UWlnEd\nCGiIouzukrOP2k5L6uFiSkSOzk2zfu3705JrPaZ+xnVoUF3KCo8czpVGzBnZ2lhIRLbRY3cH\nRm/KlYbXQTav/S6kTjxr1I6y93AdCGhC7tUik8Zt2rRxeX3TaoZvjZwxa9Y7Om560sworgMB\nDVGUZta3te1iZ1hZwbgZC8sLi7mMCaoZjy8JCQnxNKr84s7wiUisvpvJNQAADC1JREFUgw9e\n7Vd0Y/uUvbJJcb24DgQ05EJRmambiUJWlJ1bwO09OMzYcUZgXNfBmBTlHNyAB04IjD+fN+9z\n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"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "#Histogram of Bath count distribution\n",
    "hist_bath <- ggplot(df, aes(x = bath)) +\n",
    "  geom_histogram(fill = \"blue3\", color = \"white\", bins = 450) +\n",
    "  labs(title = \"Histogram of Bath Counts\",\n",
    "       x = \"Number of Bath\",\n",
    "       y = \"Count\") +\n",
    "  theme_minimal() +\n",
    "  coord_cartesian(xlim = c(1, 5)) +\n",
    "  scale_y_continuous(labels = scales::comma)\n",
    "\n",
    "print(hist_bath)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 15,
   "id": "f5c85cc6",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-02-05T20:13:02.924134Z",
     "iopub.status.busy": "2024-02-05T20:13:02.922013Z",
     "iopub.status.idle": "2024-02-05T20:13:55.470929Z",
     "shell.execute_reply": "2024-02-05T20:13:55.468648Z"
    },
    "papermill": {
     "duration": 52.576434,
     "end_time": "2024-02-05T20:13:55.484312",
     "exception": false,
     "start_time": "2024-02-05T20:13:02.907878",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Warning message:\n",
      "“\u001b[1m\u001b[22mRemoved 449785 rows containing missing values (`geom_point()`).”\n"
     ]
    },
    {
     "data": {
      "image/png": "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\nTdiNea2trccdd1ylpwAAKs9DsQAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2\nAACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQ\ndgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACR\nEHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAA\nkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYA\nAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2\nAACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQ\ndgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACREHYAAJEQdgAAkRB2AACR\nEHYAAJEQdgAAkRB2AACRqKn0AGNGkiTl2f9I39ColSRJ1d73UJXHvXiXHfdKj1Bui457pQep\npCq8+457WKl3P5VKLXdTlX+VS9fd3d3b21vpKQCAqpbJZNra2pa3VdiVaqS/UD09Pb29vel0\nepCjFbF58+aNGzeutra20oOUW3d3d19fX01Nzfjx4ys9S7klSTJv3rwJEyZkMplKz1JuXV1d\n/f39dXV148aNq/Qs5VYoFObPnz9x4sRBTjnEauHChdlstqGhobm5udKzlFsul+vo6Jg0aVKl\nB6mABQsW5PP5pqamxsbGlbXPQf75eCi2VCP9M2jR/qvwh11RKpWq2vseHPdqVYX3vXiXHfdK\nj1Bui457pQeppPLcfU+eAACIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiE\nsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCI\nhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMA\niISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLAD\nAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISw\nAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiE\nsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCI\nhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMA\niISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLAD\nAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISwAwCIhLADAIiEsAMAiISw\nAwCIhLADAIiEsAMAiISwAwCIRE2Zb+9H/3lEw5evOHiVxn8sFH53w3dvueeRVzszG2+23ZEn\nHbV+Y2ZFm4a6PryrAACMMeU8Y5e88Icf/uKNBbkkWbT04s/O+daN9+1w4LHnnnJ401/vPPuz\n309WtGmo68O7CgDAmFOmM3Zv/f6Sc2b9cU5H/7+sJgMX3/jMBodd/Im91g8hbHBBOOiIb1z/\n5mGHTmle7qbVa4e2PoxdTWkuz9cEAGDlKtMZu4kzPnHWuV//5gVnLr7Y33HPK335ffdYo/hp\nfdsuW7TUPTj77UE2DXV9GLsa2S8EAMCIKdMZu7rxa20wPuQHGhZfHOh+PISwSdM/Z9i0qeY3\nT3YMsmlgl6GtD2NXy7sL3d3dvb29Q73jQ1UoFN55552RvpXRqaNjuV/86OVyuao97vPnz6/0\nCBUzMDBQtce9vb290iNUTF9fX19fX6WnqIyq/YYPIfT09PT09KyUXWUymba2tuVtreSzYgv9\n3SGEybX/fL7C5NpMdmF2kE1DXR/Grlb2vQQAKJNyPyt2cen6phDCvGxh9bq/9+U72XxNW80g\nm4a6PoxdLW/a+vr6TGYEnzM7MDAwMDCQSqWam6vxj/y6u7sbGhpG9Cs8OvX392ez2XQ63dTU\nVOlZyi1Jku7u7qampnS66l53qa+vL5fL1dTUNDQ0rPjScSke9+bm5lQqVelZyq23tzefz9fW\n1tbX11d6lnIrFAo9PT0tLS2VHqQCenp6CoVCXV1dXV3dStnh4P92Khl2tU2bhzD72d7s6nV/\n/xZ/rjc3ftPxg2wa6vowdrW8aWtqampqRvDLVSgUimFXhT/oQwjd3d11dXW1tbWVHqTccrlc\nMeyq8LgX/4Mf6V+ZRqdsNpvL5arzuBcKheIvclUYdv39/fl8PpPJVOFxz+VyPT09VXjHQwjF\nv+Mq2y9ylfxFuWHC7mvWZW67d27x02zXIw91Drx399UH2TTU9WHsqlz3HgBgJavoIyCp2s99\nYqPnf/DFux957o0Xn7jqCxc3r/mBw9ZoHmzTUNeHsSsAgLGpkg/FhhA2+NR5n+m/5LqLv9De\nl5q2xa5f+dyxqRVtGur68K4CADDmpJLEuy2MCsUnQqfT6YkTJ1Z6lgpob29vbW2twr+x6+rq\n6uvrq6mpmTBhQqVnKbckSdrb29va2qrwb+w6Ozv7+/vr6upaW1srPUu5FQqFefPmTZo0qQr/\nxq6joyObzTY0NFThcwhyudyCBQsmT55c6UEqYP78+fl8vqmpqTxPkqu6J6MBAMRK2AEARELY\nAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC\n2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBE\nQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEA\nRELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgB\nAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELY\nAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC\n2AEARELYAQBEQtgBAERC2AEARELYAQBEomaQbdOnTy9xL88///zKGAYAgOEbLOzWW2+9co0B\nAMC7NVjY3XHHHWWbAwCAd2mwsFvaX+668fr/u++VOfPef8EVB9fe+8AbM3bdbNURmgwAgCEp\nPeyS7x618/E/urf4SdMXLtuv67Ldt7r1/cd8+84rj69JjdB4AACUqtRnxf71Jwce/6N79zz+\nkj8//3pxpW36hV/7jx1mf/+E/a94dsTGAwCgVKWG3Xmfu2PixmfdefnJMzZYo7hS07TRWVf8\n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\nP7612h4XjeiIAACUotSw2/7Cu7/4+j5fu/qybKrxqIv/sHlzbdfrN3/mnCta1trlxz89cERH\nBACgFKWGXbpm0v+78cHP97zTnZk4vj4dQmho2/eXv95htw/sMD6TGskJAQAoSalh9/dLN00e\n/8+PN/noPit9HgAAhmmwsNtqq61S6fpHHr6/+PEgl3z00UdX8lwAAAzRYGHX0tKSStcXP54w\nYUJZ5gEAYJgGC7vf//73iz7+7W9/O/LDAAAwfKW+jh0AAKNcqWH3nxfdnEuWsV7Izrns5A+v\nzIkAABiWUsPuitMOWP/9R/3x9e7FF1+55+rdpk075du3j8BgAAAMTalh9/Stl632lxt3nTr9\nzFl3hxAK2be+dcK+U3f798cyW//gt94rFgCg8koNu433O/GBV5497/CNv3ncXtP3Pub962/w\nue/NPvD07738/N1H7bruiI4IAEAphvACxZmGdc747k/eeXyLi37zgxdC2Pqkn954wSe86QQA\nwCgxhGfF/vWOWTuvt8G3Huk7+qvXnX/Mbo98+5PTP3jc/W/2jNxwAACUrtSwO+/o3abvfdzz\nq+59y+N/+8HnDznz+799+pZLmh++Zuf1Nvjcdzx5AgCg8koNu3OvffiwL/34lYd/9qGN//4W\nFBvtd9LDrzxx5gFrXHzCviM2HgAApSr1b+x+8dgr+2/WtuSVmzc47/p79tzrvJU9FQAAQ1bq\nGbulq67otTs/tveJP1l58wAAMEylnrFL8l2Xn3LsNXc91N6bW3z9rVf+lmrcZAQGAwBgaEo9\nY/fol3c76fIbFk5Yf8MpuZdffnmjGVtuMWOjmvY3UhN3/+7NnjwBAFB5pZ6x+/y3n5q02XnP\n3Xt2ku+a2tK28+XXnr32uN45szdb/0NdazSP6IgAAJSi1DN2v184sN7BHw4hpDIth63adPcj\n7SGExlV3vfbI9c77xPdHcEAAAEpTati11aSyndnix9ut1fz6za8XP173wLUWvPCtERkNAICh\nKDXsjllz3AtXn/9qfz6EsPb+a75226zi+lt3vT1SowEAMBSlht3MHx7bO/fn0yav81Jfftrh\nx/TM+e8djjrjG18+9cMXPTlx0zNHdEQAAEpR6pMnpux64aM/m/KlK29Jp0LzlJnXn3LTv13y\nzfuTpHXa3jfdPnNERwQAoBSlhl0IYYuPnfrzj51a/PhTF9+x76nPvdTdsMl71qlNjcxoAAAM\nRakPxS7uxhtv/P28vta1N9xiI1UHADBaDCfsDj744Aue71jpowAA8G4MJ+wAABiFhB0AQCQG\nC7u7X1hYtjkAAHiXBgu7D2y01qGfnzU3W1hi/YUXXrhqy8kjORUAAEM2WNjNmJi7/usz119v\nx0t++dji69OmTVu9PjPCgwEAMDSDhd3Dr78065zD6+c+eOrHttp0v+P/8Ep32cYCAGCoBgu7\ndO1qx37lmldfvu/0T+3w7K+/t+u0tY/60jULcknZhgMAoHQrfueJpjW2vfCGe0848fqTT/7s\nj7545M9+9IPzLjz9Pa11i19m7733HrEJAQAoSalvKbbOTof84qFPXn3MVkf/4Pcnf/L3S2xN\nEqfxAAAqrNSw65v72JdOPuGCG55M10487LRTNh5ft+LrAABQRisOuyTfeeM3z/zs/5v15kD+\nPXvPvGrWN3dep6UMkwEAMCQreOeJp359xe4brnXIWd+b37LJ16+//9nbr1B1AACj02Bn7E7c\nf4vLb3k8lard57gLrrj4s+s2lvq4LQAA5TdYq11+y+OTNv/wd74/61PbTSnbQAAADM9gD8Ue\n/42bXnvsFlUHADAmDHrG7rSPl20OAADepRU8eQIAgLFC2AEARELYAQBEQtgBAERC2AEARELY\nAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC\n2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBE\nQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEA\nRELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEoqay\nN//2fWcf+/UnFl+Zec3/7NfWEEIIofC7G757yz2PvNqZ2Xiz7Y486aj1GzPDWh/eVQAAxpgK\nh92CxxY0TvrIycduumhlanNd8YMXf3bOt27822HHn3B0W+7WK79z9mdzP/necamhrw9jVwAA\nY1GFw27O0wsnbLLjjjtuuuSGZODiG5/Z4LCLP7HX+iGEDS4IBx3xjevfPOzQ1WuHtj6leci7\nmtJc5i8CAMBKUeG/sfvzwv62rSbkexe+NWdBsth6f8c9r/Tl991jjeKn9W27bNFS9+Dst4e6\nPoxdleNuAwCMgAqfsXu0K1v4w2Wf/Paz2SSpaV5l70NPnvmRGSGEge7HQwibNP1zvE2ban7z\nZMfALkNbH8auljdqf3//wMDAu7/Ly5PL5UIIhUKhs7Nz5G5lNOvp6Umnq+7ZPNlsNoSQz+er\n9rh3d3enUlX3FxDFf++5XK4Kj3uSJCGErq6uSg9SAfl8PoSQzWar9rhX4R0PIRQKhRDCwMBA\n8Rvg3UulUi0tLcvbWsmwyw+83pHKrDdxhwuu+8r4/ML7f3XVRd8/p376tUduNKHQ3x1CmFz7\nz6cyTK7NZBdmh7oeQhjGVZYpl8v19/evhLu9IuW5lVGomDjVKUmSqj3uI/r70ihXKBSq9rhX\n7R0PIeTz+ZX1H/yYU83HPZfLFX+je/cymcGe6FnJsMvUrXnTTTf947PJux5y1nO/+dTdVz15\n5Dd3Ttc3hRDmZQur1/39FM472XxNW81Q10MIw7jKsqfNZGpra1fm/f9X+Xy+GPUjeiujVjab\nrampqcIzN8XjnkqlamoqfPq8Ihz3KjzuSZLkcrnq/EGXy+WSJEmn04P/xxwlxz2TyaysR6UG\n38/o+pmy9aqNd8+fG0Kobdo8hNnP9mZXr6svbnquNzd+0/FDXR/GrpY3W0NDQ0NDw8jc7xBC\n6OnpKT4WOX78cmeIWHt7e3NzcxX+m+/q6urr68tkMlV43JMkaW9vHzduXBX+J9fZ2dnf319b\nW9va2lrpWcqtUCjMmzevtbW1CoO+o6Mjm83W1dUN8jharHK53IIFC6rwB10IYf78+fl8vr6+\nvqmpqQw3V8k/aVrw3Hf+/Zjj3x4o/P3zJD/7zZ4Jm2wYQmiYsPuadZnb7p1b3JLteuShzoH3\n7r76UNeHsasy3XkAgJUt88UvfrFSt103fuq9/3PjzX+et9Zq47vnvvqbn1x021+Tz37liCl1\nmZDKbFT48w0/uW3VDTaq733j+vO/+WbT+798yM6poa6HMORdVeirkc1ms9lsKpVqbGys0AiV\n1NvbW19fX4VnbgYGBnK5XDqdHtHzwaNWb29vY2NjFT5ppvhn1JlMpr6+vtKzlFuSJL29vU1N\nTVV4xq6/v79QKNTU1NTV1VV6lnIrFAp9fX3lOWU12vT19SVJUltbW55HpVLFJ6pUSv/8p66+\n4id//PNzfTWtUzfY7GP/PnP7tf/xMnJJ/o5rL7nxjj+196WmbbHrcZ87doPiM1iHuj68q5Td\noodiJ06cWKkZKqi9vb21tbVqH4qtqamZMGFCpWcpt+JDsW1tbVUY9MWHYuvq6qr2odhJkyZV\nYdgVH4ptaGio2odiJ0+eXOlBKqD4UGxTU1N5urbCYcciwk7YVXqWchN2wq7Ss5SbsBN2Zbi5\nqnsEBAAgVsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIO\nACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLC\nDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACASwg4AIBLCDgAgEsIOACAS\nwg4AIBLCDgAgEsIOACASNZUegJLcdNNN99xzz5prrnnggQdOnz690uMAAKORsBvtbr/99oMP\nPrijo6P46VlnnfXBD37wV7/6VU2NYwcA/AsPxY5qf/3rX/fbb79FVVf0m9/85gMf+EClRgIA\nRi1hN6rNnDmzUCgsvf673/3uzTffLP88AMBoJuxGtccff3x5m37605+WcxIAYPQTdqNaLpdb\n3qaurq5yTgIAjH7CblRbe+21l7dpzz33LOckAMDoJ+xGtXPPPXeZ66uvvvp2221X5mEAgFFO\n2I1qBx544MyZM5dYbG1tnT17dkXmAQBGM2E32l1xxRWPPvro3nvvvf7662+xxRann376/Pnz\nN9xww0rPBQCMOl7kdgzYcsstb7/99kpPAQCMds7YAQBEQtgBAERC2AEARELYAQBEQtgBAERC\n2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2I0NTU1N6XQ6k8kcd9xxlZ4FABilhN1o\nV1dXl0qlent7kyQpFApXXnllOu2oAQDLIBFGtRkzZmSz2SUWkyTRdgDA0vTBqPbkk08ucz1J\nko9+9KNlHgYAGOWE3aiWJMnyNt16663lnAQAGP2E3Vg1SPMBANVJ2I1V/swOAFiCOBjVBqm3\nXC5XzkkAgNFP2I1q+Xw+lUotvV5bW1v+YQCAUU7YjXaFQiGTySz6NJVKnXfeeQMDAxUcCQAY\nnWoqPQAr5lFXAKAUztgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELY\nAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC\n2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBE\nQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEA\nRKKm0gOMGblcLp/Pj+j+QwhJkvT394/crYxm2Wy2UChUeopyK35TVedxT5IkhDAwMJBOV91v\nmMVv9UKhULXHvb+/P5VKVXqWcise93w+X4XHvfizrgrvePjH9/xKPO6pVKqurm65W4u3xwr1\n9vaO6HdkoVAo/puvqanG2s7lcplMpgp/0Ofz+SRJUqlUJpOp9CwVkMvlqvMbvvjv3XGvNsV/\n7+l0ugp/mUmSJJ/PO+4rZYfpdLq1tXV5W6vxSzw8jY2NjY2NI7f/np6enp6edDo9YcKEkbuV\nUau9vb2lpaW2trbSg5RbV1dXX19fJpOpwuOeJEl7e/u4ceOqMG46Ozv7+/tra2sH+ekcq0Kh\nMG/evPHjx1fhL3IdHR3ZbLaurq6lpaXSs5RbLpdbsGBBFf6gCyHMnz8/n883NDQ0NTWV4eaq\n7pcGAIBYCTsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsA\ngEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7\nAIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgIOwCASAg7AIBICDsAgEgI\nOwCASAg7AIBICDsAgEgIOwCASAg7AIBICLvRa5NNNkmn06lUKp1OH3XUUZUeBwAY7YTdaNTV\n1ZVKpZ555pkkSUIISZL86Ec/SqcdLABgMFphNGptbV16MUmShoaG8g8DAIwVwm7U6erqKp6o\nW1p/f3+ZhwEAxhBhN+occcQRlR4BABiThB0AQCSE3ahzzTXXVHoEAGBMEnajTktLSyqVWuam\nxsbGMg8DAIwhwm40KhQKS7ddOp3u6empyDwAwJgg7EapQqGw/fbbp1Kp4gsUn3766fl8vtJD\nAQCjWk2lB2C57rvvvkqPAACMJc7YAQBEQtgBAERC2AEARELYAQBEQtgBAERC2AEARELYAQBE\nQtgBAERC2AEARELYjTovvfTSZpttNnXq1EceeaTSswAAY4m3FBtFXnnllfe9731JkhQ/3Xrr\nrVOp1C233LLffvtVdjAAYExwxm4U2XrrrRdVXVGSJB/+8IcrNQ8AMLYIu9Fim222Wd6mlpaW\nck4CAIxRwm60eOaZZ5a3qbu7u5yTAABjlLADAIiEsBsDUqnUG2+8UekpAIDRTthVXk1NTSqV\nWuJpE4tLkmTNNdfMZDLlnAoAGHOEXYW1tbXl8/lSLlkoFOrr60d6HgBg7BJ2FbZgwYLSLzww\nMDBykwAAY52wAwCIhLADAIiEsAMAiISwG0tSqdQZZ5xR6SkAgFFK2FXY1ltvXfqFkyT5xje+\nkU6nu7q6Rm4kAGCMEnYVtsMOO6RSqSFdJUmS1tbWEZoHABi7hF2FnXrqqY2NjUN98eEkSS69\n9NIRGgkAGKOEXYVNnTr1jjvumD59+lCveNZZZ43EPADA2CXsKm/HHXd8/PHHf/3rX1944YXj\nx48v8Volvl8FAFA9hN2oUFtb+/73v/+ggw7acMMNS7zKkJ51AQBUg5pKD8A/7brrrq+88kqJ\nF77vvvtGdBgAYMxxxm60uPnmm0uvukMPPXREhwEAxiJn7EaLG264YXmbWlpauru7kyQJIaTT\n6Y6OjpaWljKOBgCMDcJutBjkodVcLlcoFMo5DAAwFnkodrTo7u5e3qZcLlfOSQCAMUrYjRaD\nPLpaW1tbzkkAgDFK2I0KBxxwwJw5c5a3daONNirnMADAGOVv7CqvpqZm8FcbPv7448s2DAAw\ndjljV2HrrbfeCt9D4tlnn13m+mGHHTZu3LjjjjtuBOYCAMYeYVdhf/vb31Z4mbvuuiudTqdS\nqVQq1dDQEEKYMGFCKpX68Y9/3NXVdeWVV6ZSqVVXXXXkhwUARjVhNwY8+uijxRexCyH09/en\nUqmOjo4lLjN37txUKlVXVzd79uyyDwgAjArCLirZbHa33Xb7+Mc/XulBGKv233//J598stJT\nADBMwi5CP//5z7u6uio9BWPJ8ccfX3ys/5Zbbtl8881TqdT06dMrPRQAQybs4rTPPvuUeMkf\n/vCHhx566KGHHnrNNdeM6EiMWqeccsp3v/vdJRZfeOGFSZMmVWQeAIbNy53E6emnn17hZR5+\n+OG99967vb29+On1119/+umn33nnnTNmzBjh6RhdLr300mWuz5s3r8yTAPAuOWMXp+bm5sEv\nMDAwsMsuuyyquqK5c+futNNO3sGs/GbPnl184nM6nU6n06+//nqlJ/q7M844o9IjADAEwi5O\nF1xwweAX+OpXv9rb27v0eldX10UXXbTMq8yaNWvcuHEPPfTQSpiPxay++uoHHHBA8YnPSZIk\nSbLWWms1Njau8Irbb799JpNpaGj4v//7vxGa7dZbbx2hPQMwEoRdhGpraw899NDBLzPIq6Lc\neeedS+8wlUrNnDmzq6trm222KZ5Yam1tPeKII1bCuNXttNNOW+YrVPf19d1xxx3Lu9Y666yT\nSqUeeOCBQqHQ39+/zz77pNMj8m/5xBNPHIndAjBChF1sxo0bV8pTYgd5u4vf/e53M2fOLBQK\nxU8zmczSD84mSdLZ2XnttdemUqlp06YdfPDBDz744LsZe6RlMplFj3Wuttpq73nPez74wQ9e\neuml2Wy2soPNmjVreZv23nvvZa4ffvjhr7766hKLSZIMu+1SqdTyNv3nf/7n8PYJQEUIu6hM\nmTIlhDB+/Pj11lvvgQceGOSS22+//fI25XK5WbNmTZkypa+vL4SwqPCW58UXX/zpT3+63Xbb\nnX/++YuvP/nkk0ccccQee+xx1VVXDeE+rGz77LNPKpUqFAqLHuucM2fOc889d9ddd51yyilb\nb731En9oWGaLXnq6dD/+8Y+Xt6vhfalvu+22Za7vtNNOw9gbABWUGsb/K6xEmUxmheU0bLvt\ntttvf/vbZW5auHBhW1vb4Dd9yCGHNDc3l9gKxbM+jz766BZbbJHL5dZbb73FnwGQyWRmzZp1\n9NFHL+/q7e3tra2ttbW1pdzWkAxyOqq49aijjvrBD35Q4t6++tWvnnvuuaussspjjz12++23\nL1y48EMf+tC0adNGYrxijw7pKul0eoVvPbxMb7311hprrLH4T4NLLrnk5JNPHsauSpckSXt7\ne1tbWyaTGdEbGoU6Ozv7+/vr6upaW1srPUu5FQqFefPmTZo0afB/m1Hq6OjIZrMNDQ0tLS2V\nnqXccrncggULJk+eXOlBKmD+/Pn5fL6pqampqakMNyfsKmykf7RddtllxT+Tam9vP++88+6+\n++633357880333vvvU8//fTBr5tOp5uamkp/reNUKnXGGWecf/75EydOnD9//tIXeOKJJzbb\nbLMlFq+//vrDDz88n8+nUqm99tpr5T4PoLW1tbOzc/DLNDY2dnR0rLApp06d+tJLLy1z02ab\nbXbbbbetvfbaw5gwnU4v79/gMMJueVcZnYSdsKv0LOUm7IRdOW4voaJG+viOGzcuSZInnnhi\n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\nRK5CYII="
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "# scatterplot Price vs acre lot\n",
    "#I need to scale to m\n",
    "scatter_acre <- ggplot(df, aes(x = bath, y = house_size)) +\n",
    "  geom_point() +\n",
    "  labs(title = \"Scatterplot\",\n",
    "       x = \"X-axis Label\",\n",
    "       y = \"Y-axis Label\") +\n",
    "  theme_minimal()\n",
    "\n",
    "print(scatter_acre)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 16,
   "id": "7087e831",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-02-05T20:13:55.510364Z",
     "iopub.status.busy": "2024-02-05T20:13:55.508381Z",
     "iopub.status.idle": "2024-02-05T20:13:55.525177Z",
     "shell.execute_reply": "2024-02-05T20:13:55.522463Z"
    },
    "papermill": {
     "duration": 0.033298,
     "end_time": "2024-02-05T20:13:55.528118",
     "exception": false,
     "start_time": "2024-02-05T20:13:55.494820",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# scatterplot Price vs bed"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 17,
   "id": "69c7bd7c",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-02-05T20:13:55.554248Z",
     "iopub.status.busy": "2024-02-05T20:13:55.552269Z",
     "iopub.status.idle": "2024-02-05T20:13:55.567909Z",
     "shell.execute_reply": "2024-02-05T20:13:55.565778Z"
    },
    "papermill": {
     "duration": 0.031688,
     "end_time": "2024-02-05T20:13:55.570658",
     "exception": false,
     "start_time": "2024-02-05T20:13:55.538970",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# scatterplot Price vs bath"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 18,
   "id": "e6f59e61",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-02-05T20:13:55.597024Z",
     "iopub.status.busy": "2024-02-05T20:13:55.594796Z",
     "iopub.status.idle": "2024-02-05T20:13:55.610459Z",
     "shell.execute_reply": "2024-02-05T20:13:55.608241Z"
    },
    "papermill": {
     "duration": 0.031685,
     "end_time": "2024-02-05T20:13:55.613027",
     "exception": false,
     "start_time": "2024-02-05T20:13:55.581342",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# scatterplot Price vs house sized"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 19,
   "id": "767d9735",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-02-05T20:13:55.639468Z",
     "iopub.status.busy": "2024-02-05T20:13:55.637430Z",
     "iopub.status.idle": "2024-02-05T20:13:55.654164Z",
     "shell.execute_reply": "2024-02-05T20:13:55.651587Z"
    },
    "papermill": {
     "duration": 0.033044,
     "end_time": "2024-02-05T20:13:55.656960",
     "exception": false,
     "start_time": "2024-02-05T20:13:55.623916",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "# Map of City"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 20,
   "id": "8e88555b",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-02-05T20:13:55.683161Z",
     "iopub.status.busy": "2024-02-05T20:13:55.681120Z",
     "iopub.status.idle": "2024-02-05T20:13:55.697930Z",
     "shell.execute_reply": "2024-02-05T20:13:55.695559Z"
    },
    "papermill": {
     "duration": 0.03321,
     "end_time": "2024-02-05T20:13:55.700913",
     "exception": false,
     "start_time": "2024-02-05T20:13:55.667703",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "#Map of statte"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 21,
   "id": "893fe406",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2024-02-05T20:13:55.727830Z",
     "iopub.status.busy": "2024-02-05T20:13:55.725687Z",
     "iopub.status.idle": "2024-02-05T20:13:55.742799Z",
     "shell.execute_reply": "2024-02-05T20:13:55.739868Z"
    },
    "papermill": {
     "duration": 0.033695,
     "end_time": "2024-02-05T20:13:55.745756",
     "exception": false,
     "start_time": "2024-02-05T20:13:55.712061",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "#Map of Zip_code"
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
   "duration": 123.633788,
   "end_time": "2024-02-05T20:13:55.981380",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2024-02-05T20:11:52.347592",
   "version": "2.5.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}

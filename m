From: William Tambe <tambewilliam@gmail.com>
Date: Mon, 25 May 2020 15:45:00 -0400
Subject: [Buildroot] Service error during booting
Message-ID: <CAF8i9mPeRJWb2K9PjaojELMc-6fK6G-2bzRwi4ak3gJ2YcbSCQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am seeing the following error during booting; any idea what could be missing ?

Starting syslogd: start-stop-daemon: option requires an argument -- 'x'
BusyBox v1.31.1 (2020-05-25 11:34:54 CDT) multi-call binary.

Usage: start-stop-daemon [OPTIONS] [-S|-K] ... [-- ARGS...]

Search for matching processes, and then
-K: stop all matching processes
-S: start a process unless a matching process is found

Process matching:
        -u USERNAME|UID Match only this user's processes
        -n NAME         Match processes with NAME
                        in comm field in /proc/PID/stat
        -x EXECUTABLE   Match processes with this command
                        in /proc/PID/cmdline
        -p FILE         Match a process with PID from FILE
        All specified conditions must match
-S only:
        -x EXECUTABLE   Program to run
        -a NAME         Zeroth argument
        -b              Background
        -N N            Change nice level
        -c USER[:[GRP]] Change user/group
        -m              Write PID to pidfile specified by -p
-K only:
        -s SIG          Signal to send
        -t              Match only, exit with 0 if found
Other:
        -o              Exit with status 0 if nothing is done
        -v              Verbose
        -q              Quiet
FAIL
Starting klogd: start-stop-daemon: option requires an argument -- 'x'
BusyBox v1.31.1 (2020-05-25 11:34:54 CDT) multi-call binary.

Usage: start-stop-daemon [OPTIONS] [-S|-K] ... [-- ARGS...]

Search for matching processes, and then
-K: stop all matching processes
-S: start a process unless a matching process is found

Process matching:
        -u USERNAME|UID Match only this user's processes
        -n NAME         Match processes with NAME
                        in comm field in /proc/PID/stat
        -x EXECUTABLE   Match processes with this command
                        in /proc/PID/cmdline
        -p FILE         Match a process with PID from FILE
        All specified conditions must match
-S only:
        -x EXECUTABLE   Program to run
        -a NAME         Zeroth argument
        -b              Background
        -N N            Change nice level
        -c USER[:[GRP]] Change user/group
        -m              Write PID to pidfile specified by -p
-K only:
        -s SIG          Signal to send
        -t              Match only, exit with 0 if found
Other:
        -o              Exit with status 0 if nothing is done
        -v              Verbose
        -q              Quiet
FAIL
Running sysctl:

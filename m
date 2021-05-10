From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 10 May 2021 09:11:39 +0200
Subject: [Buildroot] [PATCH 1/1] package/hwloc: bump to version 2.4.1
In-Reply-To: <20210507183009.2584138-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 7 May 2021 20:30:09 +0200")
References: <20210507183009.2584138-1-fontaine.fabrice@gmail.com>
Message-ID: <87r1ift650.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Add ac_cv_prog_cc_c99 to avoid a build failure due to
 >   https://github.com/open-mpi/hwloc/commit/f2226f76e104923a76c5d09328284104abad6b01
 > - Update hash of COPYING, copyrights added with
 >   https://github.com/open-mpi/hwloc/commit/ebaa3595e2ddc6e0e94e8ea5b1472f1a21969c80
 > - Update indentation in hash file (two spaces)

 > As a side effect, this will remove numactl dependency (which raises a
 > build failure with sparc v8 since commit
 > 4ed540ddf59bec4b389be44d7f42820d2466904f) thanks to:
 > https://github.com/open-mpi/hwloc/commit/e6a53bbf65458fd5fe4d45d5a83027b530566591

 > https://github.com/open-mpi/hwloc/blob/hwloc-2.4.1/NEWS

 > Fixes:
 >  - http://autobuild.buildroot.org/results/5f9394d3bab4e83edbea9bc607c3e135adfdabbc

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard

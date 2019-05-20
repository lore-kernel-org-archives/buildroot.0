From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 20 May 2019 11:10:40 +0200
Subject: [Buildroot] [PATCH 3/3] package/pcsc-lite: security bump to
 version 1.8.25
In-Reply-To: <20190518214349.5979-3-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 18 May 2019 23:43:49 +0200")
References: <20190518214349.5979-1-fontaine.fabrice@gmail.com>
 <20190518214349.5979-3-fontaine.fabrice@gmail.com>
Message-ID: <87r28twkxb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Contains the following security related fixes:
 >  - Race condition possibility; CWE-362: Concurrent Execution using
 >    Shared Resource with Improper Synchronization ('Race Condition'):
 >    https://github.com/LudovicRousseau/PCSC/commit/36c8eae890dc81f0e25ebf0be1c6a969ffd9543a
 >  - Fix realloc error handling:
 >    https://github.com/LudovicRousseau/PCSC/commit/430043842e05a300f1dda1b93fcfa8fceadd81e5

 > Update hash of COPYING and remove MIT from licenses because sd-daemon
 > files were removed:
 > https://github.com/LudovicRousseau/PCSC/commit/0984e0f4a03e5e29bb5725b6f149f56c9e9c73c2

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard

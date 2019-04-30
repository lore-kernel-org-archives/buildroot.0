From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 30 Apr 2019 10:10:34 +0200
Subject: [Buildroot] [PATCH 1/1] package/bind: fix python build
In-Reply-To: <CAPi7W83NrB4bdbc-zbhCrP7SY0VgJpxiAxGOpfvnEcCbiRh7Fg@mail.gmail.com>
 (Fabrice Fontaine's message of "Tue, 30 Apr 2019 09:25:35 +0200")
References: <20190427134925.1730-1-fontaine.fabrice@gmail.com>
 <87ftq0ot5n.fsf@dell.be.48ers.dk>
 <CAPi7W83NrB4bdbc-zbhCrP7SY0VgJpxiAxGOpfvnEcCbiRh7Fg@mail.gmail.com>
Message-ID: <87bm0nq5fp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

Hi,

 >> If I understand it right, we need ply for the host to satisfy the
 >> configure check and ply for the target for runtime, so I guess the
 >> solution is to add a host version of the python-ply package.

 > Yes, I forgot to add the host variant of python-ply.

Will you send a patch to fix it?

-- 
Bye, Peter Korsgaard

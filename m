From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Jan 2021 20:24:50 +0100
Subject: [Buildroot] [PATCH 1/1] package/xenomai: fix build with gcc 10
In-Reply-To: <20210119173119.436246-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 19 Jan 2021 18:31:19 +0100")
References: <20210119173119.436246-1-fontaine.fabrice@gmail.com>
Message-ID: <87bldkbugt.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fixes:
 >  - http://autobuild.buildroot.org/results/551228bcc7152d5e835f3cced6329269b6bad651

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

We support custom/git versions which may not be compatible with the
patch, so I've moved the patch to a 3.0.10 subdir to ensure it only gets
applied for the latest version and applied - Thanks.

-- 
Bye, Peter Korsgaard

From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 03 Nov 2014 09:00:06 +0100
Subject: [Buildroot] [git commit] package: indentation cleanup
In-Reply-To: <20141103083336.7b4da4c2@free-electrons.com> (Thomas Petazzoni's
 message of "Mon, 3 Nov 2014 08:33:36 +0100")
References: <20141102223855.CCFA5B2F3F@busybox.osuosl.org>
 <20141103083336.7b4da4c2@free-electrons.com>
Message-ID: <87zjc83e9l.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > Dear Peter Korsgaard,
 > On Sun, 2 Nov 2014 23:27:01 +0100, Peter Korsgaard wrote:

 >> diff --git a/package/gdb/Config.in b/package/gdb/Config.in
 >> index a96df1e..b211878 100644
 >> --- a/package/gdb/Config.in
 >> +++ b/package/gdb/Config.in
 >> @@ -8,7 +8,7 @@ config BR2_PACKAGE_GDB
 >> # target, we don't allow building a separate gdbserver. The
 >> # one from the external toolchain should be used.
 >> select BR2_PACKAGE_GDB_SERVER if \
 >> -	       (!BR2_PACKAGE_GDB_DEBUGGER && !BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY)
 >> +		(!BR2_PACKAGE_GDB_DEBUGGER && !BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY)

 > Is this really the rule that we want for Config.in file? I do prefer to
 > align with the previous line rather than enforcing the use of a fixed
 > number of tabs. But I guess it's a matter of taste.

I must say I was hessitating with this commit. Some of the changes I
liked, others less so.

In general, as long as the text is readable and files are not too
inconsistent then I don't care much about these details.

-- 
Bye, Peter Korsgaard 

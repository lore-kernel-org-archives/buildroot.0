From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Feb 2015 22:35:32 +0100
Subject: [Buildroot] [PATCH v1 1/4] directfb: bump version to 1.7.7
In-Reply-To: <1424905508-30186-1-git-send-email-ps.report@gmx.net> (Peter
 Seiderer's message of "Thu, 26 Feb 2015 00:05:05 +0100")
References: <1424905508-30186-1-git-send-email-ps.report@gmx.net>
Message-ID: <87twy85paz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Remove 0003-remove-redefinition-of-__typeof__.patch (the only upstream
 > committed patch).

Thanks, but please merge the patch bumping the version with the one
adding the hash file as well.

Are you sure no other changes are needed? From the NEWS file I see:

1.7.0
-----
Major new feature:

- task-manager (must be enabled explicitly)

  The task manager allows to automatically distribute rendering tasks over
  multiple cpu and/or gpu cores. There is an implementation for the generic
  (software) driver which can be configured with by setting software-cores=<n>
  and task-manager options in the directfbrc.

Merged Projects:
- DirectFB-extra (missing bits)
- SaWMan
- FusionDale
- FusionSound
- DiVine
- ++dfb

So I was expecting to see an option to enable the task manager support
and dropping of the sawman package?

-- 
Bye, Peter Korsgaard

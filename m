From: Vincent <vincent.stehle@laposte.net>
Date: Sat, 05 Apr 2014 18:30:50 +0200
Subject: [Buildroot] [PATCH] binutils: drop *.texi* hunks from xtensa
 trampolines patches
In-Reply-To: <1396710856-21928-1-git-send-email-jcmvbkbc@gmail.com>
References: <1396710856-21928-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <53402FBA.3030605@bergerie>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/05/2014 05:14 PM, Max Filippov wrote:
> Rebuilding as.info with makeinfo version 5.2 results in a build error,
> even with pristine binutils source. Dropping hunks that change *.texi*
> files avoids documentation rebuild.

Hi Max,

It works like a charm for me; thanks!

Best regards,

V.

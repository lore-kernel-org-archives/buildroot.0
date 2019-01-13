From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 Jan 2019 14:35:04 +0100
Subject: [Buildroot] [PATCH 1/1] package/zbar: switch to linuxtv zbar
 fork
In-Reply-To: <1547380110-7761-1-git-send-email-james.hilliard1@gmail.com>
References: <1547380110-7761-1-git-send-email-james.hilliard1@gmail.com>
Message-ID: <20190113143504.0fd22fe4@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 13 Jan 2019 19:48:30 +0800, james.hilliard1 at gmail.com wrote:
> From: James Hilliard <james.hilliard1@gmail.com>
> 
> The zbar upstream previously used has been abandoned since 2012.
> The linuxtv fork appears to be the most actively maintained fork.
> I've resynced patches that wouldn't apply and added a few minor bug fixes.

Please try to not use first person sentences in commit log. Also, it
would be good to explain why the current patch 0004 is removed.

> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  ...onf-by-reducing-the-warning-error-checkin.patch | 16 ++---
>  ...p-logical-not-operations-into-parentheses.patch | 80 ----------------------
>  ...eo-buffers-after-probing-and-request-them.patch | 51 ++++++++++++++
>  ...-ENOTTY-errors-when-calling-VIDIOC_S_CROP.patch | 26 +++++++

These patches are not just trivial build fixes. I'd like to see them be
submitted upstream. I suggest that you send them to Mauro + the
linux-media kernel mailing list in Cc, with some patch prefix such as
[PATCH zbar] so that it is clear to what project they apply.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

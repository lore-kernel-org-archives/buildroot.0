From: Patrick Noffke <patrick@noffke.me>
Date: Wed, 08 Apr 2015 10:51:48 -0500
Subject: [Buildroot] [PATCH 1/1] Toolchain - Add option to enable Ada
	language.
In-Reply-To: <1572450641.2711242.1428504046971.JavaMail.root@openwide.fr>
References: <1572450641.2711242.1428504046971.JavaMail.root@openwide.fr>
Message-ID: <1474058.4ZllOqIG4k@noffke.mortara.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wednesday, April 08, 2015 04:40:46 PM Jeremy Rosen wrote:
> please resend your patch as an inline patch... ideally using git
> send-email
> 

I will send the patch separately using git send-email.  I have to send from another PC.

> moreover, from a quick review, you seem to have a commented
> line/section in your patch, please remove it so the patch is
> cleaner...
> 

The comments are nearby lines in the source file.  I did not add them.  I generated the patch following the buildroot manual, specifically using:

$ git format-patch -M -n -s -o outgoing origin/master

Please let me know if I'm doing something wrong -- this is my first patch to buildroot.

Thanks,
Patrick

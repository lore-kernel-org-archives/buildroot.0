From: Christian Stewart <christian@paral.in>
Date: Thu, 10 Oct 2019 09:54:08 -0700
Subject: [Buildroot] Buildroot for Texas Instruments AM65X - add 2nd
 toolchain?
In-Reply-To: <1570722967330.68145@amazon.com>
References: <1570715805181.62328@amazon.com> <20191010163330.358f056d@windsurf>
 <1570722967330.68145@amazon.com>
Message-ID: <CA+h8R2qsrWeFd+ipdztBmGfpebMf_Orp3f9aFz-6tYmu8NeTkg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Scott,

On Thu, Oct 10, 2019, 8:57 AM Whitney, Scott <scwhitn@amazon.com> wrote:

> Please excuse the dumb question.  Since I am a "newbie" to Buildroot, what
> is the proper method to obtain and apply this patch and use it?  Or does
> that need to wait until you do your rework?
>

Save the contents of the email body to a file (usually a .patch or a .mbox)
and use "git am" on the file.

https://buildroot.org/downloads/manual/manual.html#_reviewing_and_testing_patches

Perhaps you don't literally mean how do you apply it, but just in case,
here's some reference.

Best,
Christian Stewart
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191010/d6601754/attachment.html>

From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Fri, 3 Aug 2012 23:05:06 -0400
Subject: [Buildroot] [PATCH 1/6] cjson: Add license info
In-Reply-To: <501B8DF6.3060109@lucaceresoli.net>
References: <1343962432-2772-1-git-send-email-danomimanchego123@gmail.com>
 <501B8DF6.3060109@lucaceresoli.net>
Message-ID: <CANxTyt7qwL+poynOT7WeE_RC8fRwniCujz7GwUvPeioSyArZ+w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Aug 3, 2012 at 4:38 AM, Luca Ceresoli <luca@lucaceresoli.net> wrote:
>
> Unfortunately that README is not a license file. Ok, it starts
> with the license, but then goes on with a description of the
> packages, how to build, etc. The license is just 10% of the whole
> file. This is off topic in licenses.txt.
>

Doh, you're correct, the license part is just the author's file header,
just like the actual source.  I hadn't noticed that.


> This is one of the known cases that `make legal-info` is unable to
> handle correctly, so you should a) skip the definition of
> CJSON_LICENSE_FILES, or b) ask the developers include a proper
> license file, or c) extend legal-info to handle these cases. :)


cJSON is not updated often, so I will resubmit the patch without the FILES
definition, and then think about the other two options for later.  Thanks.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120803/8d863a95/attachment.html>

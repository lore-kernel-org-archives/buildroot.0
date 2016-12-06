From: Brandon Maier <brandon.maier@rockwellcollins.com>
Date: Tue, 6 Dec 2016 11:13:08 -0600
Subject: [Buildroot] [RFC v2 4/4] support/download/git: shallow fetch of
 all branches
In-Reply-To: <20161202152123.20399-5-ricardo.martincoski@datacom.ind.br>
References: <20161202152123.20399-1-ricardo.martincoski@datacom.ind.br>
 <20161202152123.20399-5-ricardo.martincoski@datacom.ind.br>
Message-ID: <CA+fik51+qcpnLCT9RuEvyGKf5Yf5-XNz5KLv3G-vfnE485unEg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Dec 2, 2016 at 9:21 AM, Ricardo Martincoski <
ricardo.martincoski@datacom.ind.br> wrote:
>
>
> As a middle ground between a --depth 1 fetch and a full clone, fetch all
> branches with depth of 100. We have a good change to catch the desired
>

Should this be "good chance"?

Also, is there any particular reason for depth 100?


> ...

+    # As a middle ground between a --depth 1 fetch and a full fetch, fetch
> all
> +    # branches with depth of 100. We have a good change to catch the
> desired


Again, "good chance"?


Altogether good idea Ricardio, I like the "--depth 100" feature. This will
be helpful for our team as well.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20161206/3247e261/attachment.html>

From: Adrian Perez de Castro <aperez@igalia.com>
Date: Tue, 20 Jun 2017 20:21:59 +0300
Subject: [Buildroot] CCACHE accross multiple buildroot projects
In-Reply-To: <20170620160412.GC2892@scaer>
References: <CAEyMn7arQ1cEb6Yy2Gkc+FCMPJYbnpKdANQzXWQaCrKzePSfgw@mail.gmail.com>
 <20170620160412.GC2892@scaer>
Message-ID: <20170620202159.GB27508@momiji.helsinki.igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 20 Jun 2017 18:04:12 +0200, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> Heiko, All,
> 
> On 2017-06-19 15:57 +0200, Heiko Thiery spake thusly:
> > is it allowed to use CCACHE accross several projects (all the same
> > architecture)?
> 
> Normally, ccache hashes a few things to ensure that it does not re-use
> incompatible obkects. It should be safe.

It is, I routinely find myself having 3-4 different Buildroot work trees, all
pointing ccache to the same directory in the file system. If you target the
same architecture in more than one work tree, builds can sometimes be faster
when the same versions of the same files are used by different work trees.

Cheers,

--
 Adri?n ?
-------------- next part --------------
A non-text attachment was scrubbed...
Name: not available
Type: application/pgp-signature
Size: 195 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170620/dd3f0a18/attachment.asc>

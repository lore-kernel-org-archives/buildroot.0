From: Christian Stewart <christian@paral.in>
Date: Fri, 10 Jan 2020 20:23:04 -0800
Subject: [Buildroot] [PATCH 1/1] rtl8821au: bump to 2020.01 commit hash
In-Reply-To: <87blrbocew.fsf@dell.be.48ers.dk>
References: <20200110050016.1924705-1-christian@paral.in>
 <87blrbocew.fsf@dell.be.48ers.dk>
Message-ID: <CA+h8R2rZL5Ca1Yp4Ec0yG9cxG5rhKQjy5tqerH1x9VPN+iPV+Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,


On Fri, Jan 10, 2020 at 2:04 AM Peter Korsgaard <peter@korsgaard.com> wrote:
> What do you mean with 2020.01? I thought you were referring to a tag,
> but I don't see any tags in that repo.

I'm just indicating that it's the latest version as of January 2020.

>  >   fa68771376a637c0b5f9cfa53da008570939a259
>
> Looking at that commit in github:
>
> https://github.com/abperiasamy/rtl8812AU_8821AU_linux/commit/fa68771376a637c0b5f9cfa53da008570939a259
>
> I see people are having problems and some discussion about reverting it,
> so are you sure we should be using it in Buildroot?

I actually noticed this about an hour after submitting the patch and
marked it as Superceeded in patchwork.

> And finally, the commit message should be prefixed with
> package/rtl8821au like your other patch.

ack.

Best,
Christian

From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Mon, 31 Jan 2011 23:52:18 +0100
Subject: [Buildroot] [PATCH] Makefile.package.in: accept upper case
 $(PKG)_SITE_METHOD as well
In-Reply-To: <AANLkTikMeVCgHZs8z-tx+X5uTT=RSdunZfmSSYTj4uc7@mail.gmail.com>
References: <1296510767-15670-1-git-send-email-bjorn.forsman@gmail.com>
	<AANLkTikMeVCgHZs8z-tx+X5uTT=RSdunZfmSSYTj4uc7@mail.gmail.com>
Message-ID: <AANLkTike_vYiEai14pf_Ww5SKj+e3bQUzq9MdE905D7O@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 31 January 2011 23:30, Daniel Nystr?m <daniel.nystrom@timeterminal.se> wrote:
> 2011/1/31 Bj?rn Forsman <bjorn.forsman@gmail.com>:
>> The Buildroot documentation says it's OK to use upper case names for
>> $(PKG)_SITE_METHOD, but the implementation does not support it. This
>> patch adds support for both upper and lower case names.
>
> In my opinion changing the documentation is a better way to go since
> it would make the mk files uniformed.

I'm not sure I understand what you mean by "uniformed". Can you give an example?

My idea of uniform .mk files would actually be to use upper case, as
there is already lots of upper case in BR. Am I wrong?

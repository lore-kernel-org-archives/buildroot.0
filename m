From: =?ISO-8859-1?Q?Daniel_Nystr=F6m?= <daniel.nystrom@timeterminal.se>
Date: Tue, 1 Feb 2011 08:59:05 +0100
Subject: [Buildroot] [PATCH] Makefile.package.in: accept upper case
 $(PKG)_SITE_METHOD as well
In-Reply-To: <AANLkTike_vYiEai14pf_Ww5SKj+e3bQUzq9MdE905D7O@mail.gmail.com>
References: <1296510767-15670-1-git-send-email-bjorn.forsman@gmail.com>
	<AANLkTikMeVCgHZs8z-tx+X5uTT=RSdunZfmSSYTj4uc7@mail.gmail.com>
	<AANLkTike_vYiEai14pf_Ww5SKj+e3bQUzq9MdE905D7O@mail.gmail.com>
Message-ID: <AANLkTinZUOGKU6XcCex4jHOUz0B0LB2uzBUUZzgNROV2@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2011/1/31 Bj?rn Forsman <bjorn.forsman@gmail.com>:
> On 31 January 2011 23:30, Daniel Nystr?m <daniel.nystrom@timeterminal.se> wrote:
>> 2011/1/31 Bj?rn Forsman <bjorn.forsman@gmail.com>:
>>> The Buildroot documentation says it's OK to use upper case names for
>>> $(PKG)_SITE_METHOD, but the implementation does not support it. This
>>> patch adds support for both upper and lower case names.
>>
>> In my opinion changing the documentation is a better way to go since
>> it would make the mk files uniformed.
>
> I'm not sure I understand what you mean by "uniformed". Can you give an example?
>
> My idea of uniform .mk files would actually be to use upper case, as
> there is already lots of upper case in BR. Am I wrong?

You're absolutely right, upper case seems to be most common. But it
also seems like no other options (for example PKG_INSTALL_STAGING)
handles both upper and lower case which I consider a good thing since
it's what makes the mk files uniformed. :)
See: http://git.buildroot.net/buildroot/tree/package/Makefile.package.in#n454

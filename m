From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 6 May 2013 12:02:02 +0200
Subject: [Buildroot] [PATCH 06/33] sylpheed: fix build disabling gpgme
	support
In-Reply-To: <87wqrck04n.fsf@dell.be.48ers.dk>
References: <1353543503-8952-1-git-send-email-s.martin49@gmail.com>
 <1353543503-8952-7-git-send-email-s.martin49@gmail.com>
 <87d2z4fzwh.fsf@dell.be.48ers.dk> <87wqrck04n.fsf@dell.be.48ers.dk>
Message-ID: <CAHXCMMKe9wtf_PfRq95jt60KdwET7tHu7JtMhWCvPGmkJAUO+Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter, all,

2013/5/6 Peter Korsgaard <jacmet@sunsite.dk>:
>>>>>> "Peter" == Peter Korsgaard <jacmet@uclibc.org> writes:
>
>  Samuel> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
[...]>  Samuel> -SYLPHEED_CONF_OPT = --disable-gtkspell
>  Samuel> +SYLPHEED_CONF_OPT = --disable-gtkspell --disable-gpgme
>
>  Peter> Why? Does it pick up libgpgme from the host?
iirc, it does, but i'm not sure.

>
>  Peter> It would be good if you could write a bit more detailed commit
>  Peter> messages.
>
> Samuel, I don't think you ever replied to this. Can the patch be dropped
> or is it still needed?
Right. You can drop it for now.

If i trigger the problem again, I'll resend it.
Also, iirc, someone posted some patch about libgpgme, but i haven't
tried it yet.

Regards,

-- 
Samuel

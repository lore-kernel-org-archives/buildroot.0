From: =?UTF-8?B?SsOpcsOpbXkgUk9TRU4=?= <jeremy.rosen@smile.fr>
Date: Thu, 19 Dec 2019 14:50:26 +0100
Subject: [Buildroot] [PATCH v5 00/13] use host-systemd to enable units
In-Reply-To: <20191218174847.GD4247@scaer>
References: <20191216103052.35220-1-jeremy.rosen@smile.fr>
 <20191218174847.GD4247@scaer>
Message-ID: <CAFvCimVGu5Bv3GFUmaQtkBjUHbWFoSbagCLsp3_Mb+yztJLH5g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ok, my bad for having you work on it that much, I have still lot to learn
about all
those conventions

One specific point I don't agree with below, but it's just a detail at this
point

>
> 35c11a027c package/systemd: add host variant
>       - reformatting in commit log
>       - declare host variant after target variant
>       - simplify comments
>       - slight reordering of variable (HOST_SYSTEMD_NINJA_ENV moved)
>       - reformatting for mutli-line variable (HOST_SYSTEMD_HOST_TOOLS)
>       - don't split HOST_SYSTEMD_CONF_OPTS in two sets
>
well, it's applied now, but I did that in a very specific way

* Variables I specifically set were in the first set
* Disabling all optional features was in the second set

The point was to help maintainability.

Apart from that, nothing suspicious on my side
thx a lot
-- 
[image: SMILE]  <http://www.smile.eu/>

20 rue des Jardins
92600 Asni?res-sur-Seine
*J?r?my ROSEN*
Architecte technique

[image: email] jeremy.rosen at smile.fr
[image: phone]  +33 6 88 25 87 42
[image: url] http://www.smile.eu

[image: Twitter] <https://twitter.com/GroupeSmile> [image: Facebook]
<https://www.facebook.com/smileopensource> [image: LinkedIn]
<https://www.linkedin.com/company/smile> [image: Github]
<https://github.com/Smile-SA>

[image: D?couvrez l?univers Smile, rendez-vous sur smile.eu]
<https://www.smile.eu/fr/publications/livres-blancs/yocto?utm_source=signature&utm_medium=email&utm_campaign=signature>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191219/23d99010/attachment.html>

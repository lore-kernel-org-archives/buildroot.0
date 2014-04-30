From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 30 Apr 2014 10:36:46 -0300
Subject: [Buildroot] [PATCH] btrfs-progs: new package
In-Reply-To: <5360212B.20504@mind.be>
References: <1398790166-18900-1-git-send-email-gustavo@zacarias.com.ar>
 <20140429165618.GB3248@free.fr> <535FDC9F.70805@zacarias.com.ar>
 <5360212B.20504@mind.be>
Message-ID: <5360FC6E.8060907@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/29/2014 07:01 PM, Arnout Vandecappelle wrote:
>  Still, it may be useful to add it as a Config.host option, for use in
> post-image scripts (which may indeed have sudo).

It will need to hostize some of the dependencies as well, like acl and attr.
Takers welcome :)
Regards.

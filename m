From: Daniel Mack <zonque@gmail.com>
Date: Sat, 03 Dec 2011 20:07:25 +0100
Subject: [Buildroot] [PATCH v4 1/5] libnl: bump to version 3.2.3
In-Reply-To: <20111203194847.4ece94f7@skate>
References: <1322931812-10734-1-git-send-email-zonque@gmail.com>
 <20111203194847.4ece94f7@skate>
Message-ID: <4EDA736D.6060704@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 12/03/2011 07:48 PM, Thomas Petazzoni wrote:
> Le Sat,  3 Dec 2011 18:03:28 +0100,
> Daniel Mack <zonque@gmail.com> a ?crit :
> 
>> This newer version splits the library code into libnl, libnl-route,
>> libnl-genl and libnl-nf, each individually selectable via pkgconfig.
> 
> Thanks for those updates. I have a couple of comments/questions:
> 
>  * It would be nice if you could send each version of the patch set
>    with a cover e-mail (a 0/5 e-mail) that contains a changelog between
>    the different versions of your patchset (i.e, what changed from v2
>    to v3, from v3 to v4)

Yes, I omitted that as the discussions about them were streamlined and
the changes so simple. But you're right, I should have done that.

>  * Many of your patches are introducing patches for various components.
>    Have you submitted those to the respective upstream projects ?

They actually don't. All I'm touching are build settings and buildroot's
internal patches against the upstream packages. The latter could be
pushed back at some point, but that's actually unrelated to my changes :)


Daniel

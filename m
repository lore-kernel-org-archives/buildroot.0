From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Wed, 25 Sep 2013 11:42:01 -0400
Subject: [Buildroot] [PATCH] jq: new package
In-Reply-To: <5242EFDF.5090101@trzebnica.net>
References: <1380070714-1795-1-git-send-email-danomimanchego123@gmail.com>
 <bb47a7f9-6e83-4203-a8be-7038e346998c@email.android.com>
 <CANxTyt4RWk4=cF0-VvaQWnqGDyzUWoAdVRf2Cj50WxQCty0pLw@mail.gmail.com>
 <5242EFDF.5090101@trzebnica.net>
Message-ID: <CANxTyt6y3OENf_zOd76y7SJ=9qJddYnrZGePZb6mmQOHraG7TQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Jerzy,

On Wed, Sep 25, 2013 at 10:14 AM, Jerzy Grzegorek
<jerzy.grzegorek@trzebnica.net> wrote:
>>>> +JQ_VERSION = 1.3
>
>
> JQ_VERSION = jq-1.3

Ah, you're right, specifying version as "jq-1.3" work with the github
rule in the buildroot users manual.  Though, then you get a tarball
called "jq-jq-1.3.tar.gz", which seems odd.

Is it better to use the normal github site and get this strange name?
That section of the manual says "Packages on github often don?t have a
download area with release tarballs."  But this package *does* have a
download area, to get "jq-1.3.tar.gz" and older version.  So I'm
thinking that I can keep as is.

No?

Danomi -

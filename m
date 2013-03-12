From: Gilles Talis <gilles.talis@gmail.com>
Date: Tue, 12 Mar 2013 16:44:33 -0700
Subject: [Buildroot] IOzone license questions
In-Reply-To: <513FBB11.8070900@mind.be>
References: <CAKcgs2yfYVyZHbBVno+u4uLLkfNeL8iLqXmqgtF4+9xv12akgQ@mail.gmail.com>
 <513FBB11.8070900@mind.be>
Message-ID: <CAKcgs2wUL=uMQNBznM+NROL+LsugnKuhkhSkiKsHxMBGScyFjg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

>> My questions are the following:
>> - Is it OK to add this package to buildroot, despite its restrictive
>> license?
>
>
>  Yes. But it means that we are not allowed to add cross-compilation
> patches... So we'll probably have to add a bunch of 'depends on' conditions.
>
>  I propose something like
>
> IOZONE_LICENSE = IOZone license (NO DERIVED WORKS ALLOWED)
OK. Good suggestion. Will do that. Thanks.

>
>
>> - The text of the license is not provided with the source code, but is
>> available on IOzone website.
>> Should I point to the website link in the package makefile?
>> e.g. IOZONE_LICENSE_FILES = http://www.iozone.org/docs/Iozone_License.txt
>> Or should I leave it to the user to go and find it on his own?
>
>
>  Unfortunately, URLs don't work for LICENSE_FILES. So just add a comment in
> the .mk file pointing to the URL.
OK. That works for me. Thanks for the suggestions!

Cheers,
Gilles.

From: Will Newton <will.newton@gmail.com>
Date: Thu, 30 Jul 2009 10:14:26 +0100
Subject: [Buildroot] [PATCH/RFC] add tcpreplay tool
In-Reply-To: <a038bef50907292018x3041d740k89783f8bf4d5657d@mail.gmail.com>
References: <4A71B59E0200006800015A5C@gwia.alliedtelesyn.co.nz>
	<a038bef50907292010o634882f2p268bceac900afc6f@mail.gmail.com>
	<a038bef50907292018x3041d740k89783f8bf4d5657d@mail.gmail.com>
Message-ID: <87a5b0800907300214h1221316fx95c010473b032b6e@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jul 30, 2009 at 4:18 AM, Chris Packham<judge.packham@gmail.com> wrote:
> On Thu, Jul 30, 2009 at 3:10 PM, Chris Packham<judge.packham@gmail.com> wrote:
>> Hi Buildroot,
>>
>> Is there any interest in incorporating tcpreplay as a package?
>
> Sorry for the spam but I think gmail ate my homework. If there is
> interest I can resend the patch as an attachment.

Yes, there's always interest in adding more useful packages to buildroot.

It should be possible to shorten the makefile significantly by using
the package/Makefile.autotools.in infrastructure to e.g. do the
download, patch, autoconf and configure steps. See for example
package/midori/midori.mk.

Now buildroot is maintained in git it is preferable to submit patches
as git patches with a Signed-off-by line, and patches that are
submitted in that way are usually applied more quickly. It's also a
good idea to open a new feature request in the bugzilla so your patch
does not get lost.

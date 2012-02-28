From: Chris Kerios <ckerios@gmail.com>
Date: Tue, 28 Feb 2012 07:49:28 -0500
Subject: [Buildroot] RC3 ctng toolchain build failure
In-Reply-To: <4F4C891F.8070207@lucaceresoli.net>
References: <CAKyeDQ9trStPDomP37wKGCbgobgWmjt6UkG-amrFLOj_KvPcXA@mail.gmail.com>
 <4F4C891F.8070207@lucaceresoli.net>
Message-ID: <CAKyeDQ-TSuNVwD4SOdV4YT5EUyqv28zSdpf0jwB5A-e=iBxjMg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Feb 28, 2012 at 2:58 AM, Luca Ceresoli <luca@lucaceresoli.net> wrote:
> Hi Chris,
>
>
> Chris Kerios wrote:
>>
>> Doing a vanilla build (nothing other than defaults) on Fedora 14 host
>> for a i386/geode target. ?No packages added, just brought up make
>> xconfig and set for ctng with uclibc for the library and saved. ?No
>> other settings ?were used other than defaults for everything. ?Was not
>> using ccache either. ?Seems it can't find fenv.h for some reason.
>> Researched news list and didn't see anything on this except something
>> a few months ago about version conflicts and not using ccache. ?Also,
>> I didn't select to build C++ either. ?Any ideas? ?Messages below.
>
>
> Could you please send your Buildroot configuration file (.config)?
> When reporting bugs this makes it much easier for other people
> to reproduce and investigate the problem.
>
> Luca
>


Oops sorry....here it is. ?Another piece of info. ?I did the same
build with eglibc and glibc as selections. ?Eglibc ran clean. ?Glibc
failed.
Chris
-------------- next part --------------
A non-text attachment was scrubbed...
Name: brconfig
Type: application/octet-stream
Size: 20960 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120228/23f8fcfd/attachment-0001.obj>

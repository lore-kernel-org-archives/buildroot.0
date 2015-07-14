From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Tue, 14 Jul 2015 11:10:46 +0200
Subject: [Buildroot] [PATCH 00/11] Bump ejabberd version to 15.06
In-Reply-To: <20150711122827.7f7c9d22@free-electrons.com>
References: <1436349264-11797-1-git-send-email-johan.oudinet@gmail.com>
 <20150711122827.7f7c9d22@free-electrons.com>
Message-ID: <CAJtjsKbOOmuVdNX_sB_JKa421BQr8no7HGmJ_zkZcwZRP1L9-w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks Thomas.

On Sat, Jul 11, 2015 at 12:28 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>
> On Wed,  8 Jul 2015 11:54:13 +0200, Johan Oudinet wrote:
>
>> Johan Oudinet (11):
>>   ejabberd: bump to version 15.06
>
> Applied.
>
>>   ejabberd: simplify init script by patching ejabberdctl
>
> Not applied yet, I'll send some comments as a reply to the patch itself.
>
>>   ejabberd: fix package version
>>   erlang-p1-utils: bump to version 1bf99f9
>>   erlang-p1-cache-tab: bump to version f7ea12b
>>   erlang-p1-tls: bump to version b070004
>>   erlang-p1-stringprep: bump to version 3c64023
>>   erlang-p1-xml: bump to version 2c61083
>>   erlang-p1-stun: bump to version a3dce07
>>   erlang-p1-sip: bump to version fd3e461
>>   erlang-p1-yaml: bump to version e1f081e
>
> All applied.
>
> Another side question: ejabberd has quite a few patches, can you see if
> they can be upstreamed?

Yes, that's indeed an issue. I've sent upstream the ones that are not
related to cross-compilation, and most of them have been accepted
upstream.
So, at least those patches could be removed in the next ejabberd release.
I'll try to get even more patched accepted upstream, but the ones
related to cross-compilation would need to rewrite a big part of their
configure.ac and Makefile.in files.

-- 
Johan
()  ascii ribbon campaign - against html e-mail
/\  www.asciiribbon.org   - against proprietary attachments

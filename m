From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Sun, 23 Jul 2017 07:35:55 -0500
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2017-07-22
In-Reply-To: <CANQCQpbvJMypP2s5rwTBPNsnhQ_akammE-ci4wpUqN=5mLeHRQ@mail.gmail.com>
References: <20170723063052.1CB8521DBF@mail.free-electrons.com>
 <CANQCQpa0--xE+_YtXVqfJr78i==sY0gj3fECTBKm7g-eByd9=Q@mail.gmail.com>
 <CANQCQpbvJMypP2s5rwTBPNsnhQ_akammE-ci4wpUqN=5mLeHRQ@mail.gmail.com>
Message-ID: <CANQCQpb64q5cPLin8zVD9X0CinUiERF05xcf0kjrzXHrNMkkPw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas/Peter,

On Sun, Jul 23, 2017 at 7:21 AM, Matthew Weber
<matthew.weber@rockwellcollins.com> wrote:
> Thomas/Peter,
>
> On Sun, Jul 23, 2017 at 7:19 AM, Matthew Weber
> <matthew.weber@rockwellcollins.com> wrote:
>> All,
>>
>> On Sun, Jul 23, 2017 at 1:30 AM, Thomas Petazzoni
>> <thomas.petazzoni@free-electrons.com> wrote:
>>> Hello,
>>>
>>
>> [snip]
>>
>>>       xtensa |                   nginx-1.12.1 | NOK | http://autobuild.buildroot.net/results/a09a4449beae2f78ea47585f4dfeb0b8b8b9853e |
>>>  powerpc64le |                   nginx-1.12.1 | NOK | http://autobuild.buildroot.net/results/d853a1eb3d03b63825331dc899a61356dfae1a33 |
>>>     mips64el |                   nginx-1.12.1 | NOK | http://autobuild.buildroot.net/results/1b98300088335056d9c409070bcc87435a42eeef |
>>
>> Fixed by: https://patchwork.ozlabs.org/patch/792520/
>>
>> [snip]
>>
>>>     mips64el |                 paxtest-0.9.15 | NOK | http://autobuild.buildroot.net/results/450c5388aa26d81eccb462014bee520b6e42b06b |
>>>     mips64el |                 paxtest-0.9.15 | NOK | http://autobuild.buildroot.net/results/635a988e61f5820ad8fd94bda0615b9436e6ae83 |
>>
>
> Looks like these two were download failures

Sorry that last email accidentally got sent.

It looks like all of the downloads of
https://www.grsecurity.net/~spender/paxtest-0.9.15.tar.gz on "gcc20"
and "free electrons server" consistently have a
GnuTLS: A TLS fatal alert has been received.
Unable to establish SSL connection.

That link is using HTTPS redirects.

I tested downloading "wget
https://www.grsecurity.net/~spender/paxtest-0.9.15.tar.gz" on my home
machine and a webbrowser, both seem to work ok.
My wget was "GNU Wget 1.17.1 ".

What OS version and/or wget/gnutls are those two machines using?
Google seems to note some issues with wget having a bug preventing
HTTPS redirections from working around the time of Debian7?

Matt

From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sat, 18 Oct 2014 21:08:55 +0200
Subject: [Buildroot] [PATCH buildroot-test 8/8] autobuild-run: add
 support for custom git wrapper
In-Reply-To: <20141018150047.1098f07a@free-electrons.com>
References: <1413486964-5183-1-git-send-email-patrickdepinguin@gmail.com>
 <1413486964-5183-8-git-send-email-patrickdepinguin@gmail.com>
 <20141017223023.GA7944@free.fr> <20141018150047.1098f07a@free-electrons.com>
Message-ID: <CAAXf6LWGnTirsBZ=tz1ugfbBiAY4awt8xECVatrGFNEiCrzuHw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Sat, Oct 18, 2014 at 3:00 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Yann E. MORIN,
>
> On Sat, 18 Oct 2014 00:30:23 +0200, Yann E. MORIN wrote:
>
>> You know you can make this stick, right?
>>
>>     git config --global --add core.gitproxy /path/to/git-proxy-command
>>
>> And then you're done once and for all. ;-)
>
> Yes, I was also wondering why a change to each and every git invocation
> was needed: surely like wget there should be a way to configure git to
> use a proxy.
>
> With what Yann has given, Thomas, do you still need this patch?
>


Hmm, yes indeed.
On my laptop, I don't want to do that as I need/don't need the proxy
depending on if I'm connected to the company network or not. But in
case of an autobuilder it's not the case.
So yes, I will drop this patch.

Thanks,
Thomas

From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 13 Sep 2016 08:38:43 +0200
Subject: [Buildroot] [PATCH 2/3] package/urg: fix build with gcc-6
In-Reply-To: <CAHXCMMKDKtqUpHSgmOyRAGMNkSVm4Y4zO1bWz0uj2DDPPA68nQ@mail.gmail.com>
References: <20160912192324.23682-1-s.martin49@gmail.com>
 <20160912192324.23682-2-s.martin49@gmail.com>
 <20160912224143.06cec550@free-electrons.com>
 <CAHXCMMKDKtqUpHSgmOyRAGMNkSVm4Y4zO1bWz0uj2DDPPA68nQ@mail.gmail.com>
Message-ID: <610fba50-9291-5384-cfc9-5d41744f897e@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 13-09-16 06:19, Samuel Martin wrote:
> Hi all,
> 
> On Mon, Sep 12, 2016 at 10:41 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Hello,
>>
>> On Mon, 12 Sep 2016 21:23:23 +0200, Samuel Martin wrote:
>>> Add patch fixing/adding explicit cast on negative value in char[], which
>>> is required with gcc-6 (see "Narrowing conversions" paragraph in [1])
>>>
>>> Fixes:
>>>   http://autobuild.buildroot.net/results/d0c/d0cd11163753db69a14c02e941dbda40e5f98bba/
>>>
>>> [1] https://gcc.gnu.org/gcc-6/porting_to.html
>>>
>>> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>>
>> I don't see this patch in patchwork. Did you remove it from patchwork
>> somehow ? Or was patchwork confused by something in your patch ?
> 
> Nope, I did not do anything in patchwork, it should appear...

 I expect that patchwork gets confused by the weird non-Unicode characters in
the patch and barfs. I remember seeing some patches on the patchwork mailing
list that should improve that, but they're probably not applied to the ozlabs
instance.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

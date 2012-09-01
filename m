From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 01 Sep 2012 13:49:42 +0200
Subject: [Buildroot] boost 1.51.0 bz2 archive observations
In-Reply-To: <CAHXCMM+xCS8q40aEf50jrukDcsDkzDg7WQuWoOcgD7qRZ9-D3Q@mail.gmail.com>
References: <CAJkQPO=_T94Y854wErurMiwrQyZFbW7Mt9+9ak0xGDU0ahiEaw@mail.gmail.com>
 <5041F078.2080106@mind.be>
 <CAHXCMM+xCS8q40aEf50jrukDcsDkzDg7WQuWoOcgD7qRZ9-D3Q@mail.gmail.com>
Message-ID: <5041F656.4060102@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

  [Removed boost list since I'm anyway not subscribed so can't post]

On 09/01/12 13:45, Samuel Martin wrote:
>> >    If the boost maintainers could repackage the tar file without the leading
>> >  .,
>> >  that would be really nice for us.  If not, we have to construct a workaround
>> >  in buildroot to treat the boost extraction specially. (Aras: you can
>> >  probably
>> >  just add "/boost_1_51_0" to all the references to $(@D) in the .mk file.)
> Or just declare the boost  subdir in the .mk file:
> BOOST_SUBDIR = boost_1_51_0

  My bad, I thought that only worked for autotools-package.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F

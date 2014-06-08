From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 8 Jun 2014 20:54:27 +0200
Subject: [Buildroot] [PATCH v3] faifa: new package
In-Reply-To: <20140608191648.389eebd4@free-electrons.com>
References: <1401284346-2929-1-git-send-email-maxime.hadjinlian@gmail.com>
 <20140608183400.5c399805@free-electrons.com>
 <CAHXCMMJg6Vsjd+rCU-DqDjUa0MBQzKEwNRjKg1OvkbZ1Jbq1Ew@mail.gmail.com>
 <20140608191648.389eebd4@free-electrons.com>
Message-ID: <CAGduivycuCDQ+=OMh+PTrAk7iuMB6e7Ug2+k=8S28cGRgQOtnA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, Samuel,

Thanks a lot for your fixes.

On Sun, Jun 8, 2014 at 7:16 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Samuel Martin,
>
> On Sun, 8 Jun 2014 19:08:32 +0200, Samuel Martin wrote:
>
>> Just nit and late, but why do you need override the whole commands?
>> All of this could have been set in the FAIFA_INSTALL_TARGET_OPT
>> variable (respectively in FAIFA_INSTALL_STAGING_OPT):
>>
>> FAIFA_INSTALL_TARGET_OPT = \
>>     PREFIX=/usr \
>>     STRIP=/bin/true \
>>     DESTDIR=$(TARGET_DIR) \
>>     install
>>
>> Just nitpicking ;-)
>
> True. I believe it doesn't make a lot of difference in terms of code
> factorization, so to me, both solutions are almost equivalent.
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com

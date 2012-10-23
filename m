From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 23 Oct 2012 15:09:43 +0200
Subject: [Buildroot] [PATCH 03/10] ctng: add ctng-update-config target
In-Reply-To: <CAHXCMMJbU2F-cO9w-as6bxz1ZyBZy4cc66jog-6LuWQHDdqTaQ@mail.gmail.com>
References: <1350776731-8467-1-git-send-email-arnout@mind.be>
 <1350776731-8467-4-git-send-email-arnout@mind.be>
 <CAHXCMMJbU2F-cO9w-as6bxz1ZyBZy4cc66jog-6LuWQHDdqTaQ@mail.gmail.com>
Message-ID: <50869717.6080207@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 21/10/12 17:06, Samuel Martin wrote:
>> >  +
>> >  +ctng-update-config: $(CTNG_DIR)/.config
>> >  +       cp -f $<  $(CTNG_CONFIG_FILE)
> IIRC, crosstool-NG (recently) learns how to save defconfig, so how
> about saving the ct-ng defconfig instead?

  Good idea, but non-trivial.  Feel free to add it :-)

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F

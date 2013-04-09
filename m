From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 09 Apr 2013 23:58:34 +0200
Subject: [Buildroot] Including wine package - Reg
In-Reply-To: <20130409232231.0b261d1a@skate>
References: <CAGK4xy6eXjG7MzWS81uNmthwd5ODBB_ae+DQMSFfPkX6_GfQiw@mail.gmail.com>
 <20130408231204.0b30b7df@skate>
 <CAGK4xy5fzi5F0C_CaAq0e2JJmdUhNKD3ZuBqE8cBw8dsV+HQrw@mail.gmail.com>
 <20130408233156.0ab27a38@skate>
 <CAGK4xy49Dm1G0J3w2CUzHZ2=2bObyd8i94e1mdYnzy8vTJg-KQ@mail.gmail.com>
 <CAGK4xy4fnpOkmYJJ_+YoXJHG2Rf6BrxMyXTjjYHtDDp_R8zM8g@mail.gmail.com>
 <20130409201651.35dc862f@skate>
 <CAGK4xy7fch-cGi66rLovOo8mRvRrif7Pzg_MF89vy46H5VH0SQ@mail.gmail.com>
 <20130409232231.0b261d1a@skate>
Message-ID: <51648F0A.502@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/04/13 23:22, Thomas Petazzoni wrote:
>> It throwed an error stating to use --with-wine-tools for cross compiling,
>> >hence I used
>> >WINE_CONF_OPT = --with-wine-tools=$(BUILD_DIR)/wine-$(WINE_VERSION)
> This looks odd. Why would the wine package require a reference to its
> own source directory? Doesn't sound correct.
>

  wine-tools is a separate (host) package. Quick web search doesn't turn 
up any archives, just git://source.winehq.org/git/tools.git


  Arunkumar, I'm afraid integrating wine in buildroot will turn out to be 
quite ambitious... I don't know what you are trying to do, but if it is 
just a matter of building a very customized system and you don't really 
care about cross-compilation, then you may be better off with e.g. Gentoo.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F

From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 31 May 2015 05:51:28 +0300
Subject: [Buildroot] [PATCH 1/1] package/nmap: Fix static linking
In-Reply-To: <1433022977-18011-1-git-send-email-bernd.kuhls@t-online.de>
References: <1433022977-18011-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150531025128.GA2282@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

On Sat, May 30, 2015 at 11:56:17PM +0200, Bernd Kuhls wrote:
> +# needed by libpcap
> +NMAP_LIBS_FOR_STATIC_LINK += -lz

Have you tried using pcap-config? See for example 
package/dhcpdump/dhcpdump.mk.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -

From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 3 Dec 2014 11:00:50 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-12-02
In-Reply-To: <87oarlywa8.fsf@dell.be.48ers.dk>
References: <20141203073017.2AC17100ADA@stock.ovh.net>
 <87oarlywa8.fsf@dell.be.48ers.dk>
Message-ID: <20141203090050.GB2234@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter, Yann,

On Wed, Dec 03, 2014 at 09:25:51AM +0100, Peter Korsgaard wrote:
> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
> 
>  > Build statistics for 2014-12-02
>  > ===============================
> 
>  >         success : 122
>  >        failures : 30 
>  >        timeouts : 6  
>  >           TOTAL : 158
> 
>  > Classification of failures by reason
>  > ====================================
> 
>  >             live555-2014.11.01 | 7 
>  >                     flac-1.3.1 | 3 
>  >                    dejavu-2.34 | 3 
>  >             liburiparser-0.8.1 | 3 
>  >                alsa-lib-1.0.28 | 2 
>  >                       qt-4.8.6 | 1 
>  >                pcmanfm-0.3.5.9 | 1 
>  >                iptables-1.4.21 | 1 
>  >              alsa-utils-1.0.28 | 1 
>  >                    atftp-0.7.1 | 1 
>  >                  libnss-3.17.2 | 1 
>  >               librtlsdr-v0.5.3 | 1 
>  >   toolchain-external-undefined | 1 
>  >                host-ruby-2.1.5 | 1 
>  >                        unknown | 1 
>  >                  samba4-4.1.13 | 1 
>  >                 libupnpp-0.8.6 | 1 
>  >                     parted-3.1 | 1 
>  >                   perl-gd-2.53 | 1 
>  >              xlib_libXau-1.0.8 | 1 
>  >        directfb-examples-1.6.0 | 1 
>  >                     exiv2-0.24 | 1 
>  >              python-webpy-0.37 | 1 
> 
> A lot of these seems to be because of download issues from sourceforge
> (returning HTML instead). Lets hope it is only a temporary issue.

Would it make sense to fallback to BR2_BACKUP_SITE 
(http://sources.buildroot.net) when there is a hash mismatch as in this case?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -

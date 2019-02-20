From: Vadim Kochan <vadim4j@gmail.com>
Date: Wed, 20 Feb 2019 03:56:31 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2019-02-18
In-Reply-To: <20190219070054.149B02221C@silver.osuosl.org>
References: <20190219070054.149B02221C@silver.osuosl.org>
Message-ID: <20190220015631.amdyrjzwdli22q2i@vkochan-ThinkPad-T470p>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Tue, Feb 19, 2019 at 07:00:46AM -0000, Thomas Petazzoni wrote:
> Hello,
> 
> Build statistics for 2019-02-18
> ===============================
> 
>       branch |  OK | NOK | TIM | TOT |
>    2018.02.x |  18 |   1 |   0 |  19 |
>    2018.11.x |  25 |   0 |   0 |  25 |
>       master | 205 |  40 |   2 | 247 |
>         next |  52 |  12 |   0 |  64 |
> 
> Results for branch '2018.02.x'
> ==============================
> 
> Classification of failures by reason
> ------------------------------------
> 
> neardal-33b54a55032b047fd88... | 1 
> 
> 
> Detail of failures
> ------------------
> 
>          arm | neardal-33b54a55032b047fd88... | NOK | http://autobuild.buildroot.net/results/303e3a242513ddaaa77c0ada0fe953a797dca201 |     
> 
> Results for branch 'master'
> ===========================
> 
> Classification of failures by reason
> ------------------------------------
> 
>                  qt5base-5.6.3 | 11
>               lua-curl-0.3.9-1 | 3 
>                runc-v1.0.0-rc6 | 3 
>              stress-ng-0.09.47 | 3 
>                    glm-0.9.8.4 | 2 
>                  ibrdtnd-1.0.1 | 2 
>                    luvi-v2.7.6 | 2 
>                    netsnmp-5.8 | 2 
>                        netsurf | 2 
>        poco-poco-1.8.1-release | 2 
>                    botan-2.8.0 | 1 
>        gst-plugins-bad-0.10.23 | 1 
>                    i2pd-2.22.0 | 1 
>                madplay-0.15.2b | 1 
>                    netsurf-3.8 | 1 
>                 qt5base-5.11.3 | 1 
>               spandsp-20180108 | 1 
>                    systemd-240 | 1 
>                 upmpdcli-1.4.0 | 1 
>                wireshark-2.6.6 | 1 
> 
> 
> Detail of failures
> ------------------
> 
>          sh4 |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/f37308c31d624a8f4a2bd44c34436c850198043e |     
>       mipsel |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/428bd2eda4502e92140c9619a4c14673b41105a2 |     
>      powerpc |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/6eaad2f1fb6594eb2e811971b557aa027e1d701b |     

I am pretty sure the following patch fixes these stress-ng issues:
https://patchwork.ozlabs.org/patch/1019775/

Regards,
Vadim Kochan

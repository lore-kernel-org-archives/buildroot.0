From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 24 Nov 2016 23:39:39 +0100
Subject: [Buildroot] [PATCH 3/3] qextserialport: remove redundant patch
	0001-gui
In-Reply-To: <20161124223747.31342-3-arnout@mind.be>
References: <20161124223747.31342-1-arnout@mind.be>
 <20161124223747.31342-3-arnout@mind.be>
Message-ID: <f028dd25-9928-a7ed-4957-6e4a6758d397@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 24-11-16 23:37, Arnout Vandecappelle (Essensium/Mind) wrote:
> The same thing was done in upstream commit 220d7a2f "QtGui module only
> needed by Windows", though it was done differently upstream.
> 
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> This one is probably for next (though it depends on the other 2, so only
> apply after the merge).
> ---
>  ...0001-Create-a-main-include-file-QExtSerialPort.patch} |  0
>  package/qextserialport/0001-gui.patch                    | 16 ----------------
>  ...make-to-add-a-pkgconfig-file-to-ease-usage-wit.patch} |  0
>  3 files changed, 16 deletions(-)
>  rename package/qextserialport/{0002-Create-a-main-include-file-QExtSerialPort.patch => 0001-Create-a-main-include-file-QExtSerialPort.patch} (100%)
>  delete mode 100644 package/qextserialport/0001-gui.patch
>  rename package/qextserialport/{0003-Tell-qmake-to-add-a-pkgconfig-file-to-ease-usage-wit.patch => 0002-Tell-qmake-to-add-a-pkgconfig-file-to-ease-usage-wit.patch} (100%)

 BTW I sent a pull request with our two remaining patches:
https://github.com/qextserialport/qextserialport/pull/189

 Regards,
 Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

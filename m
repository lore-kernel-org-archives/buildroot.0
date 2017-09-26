From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 27 Sep 2017 00:42:46 +0200
Subject: [Buildroot] [PATCH 1/6] configs/imx6q-sabresd: Drop the 'quad'
	notation
In-Reply-To: <1506340788-9662-1-git-send-email-festevam@gmail.com>
References: <1506340788-9662-1-git-send-email-festevam@gmail.com>
Message-ID: <7c843b10-e890-cb44-3850-ffafbde37f5a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 25-09-17 13:59, Fabio Estevam wrote:
> Now that SPL is supported a single image can run on the different
> variants of imx6 sabresd boards: imx6q, imx6dl and imx6qp.
> 
> So drop the 'quad' prefix from defconfig, directory and readme file
> to make it generic.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

 Applied the entire series to master. Excellent!

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF

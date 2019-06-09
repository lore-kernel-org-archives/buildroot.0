From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 10 Jun 2019 00:39:18 +0200
Subject: [Buildroot] [PATCH 2/2] package/samba4: drop third patch
In-Reply-To: <20190609151516.19626-2-fontaine.fabrice@gmail.com>
References: <20190609151516.19626-1-fontaine.fabrice@gmail.com>
 <20190609151516.19626-2-fontaine.fabrice@gmail.com>
Message-ID: <5772afdf-208c-1276-be70-aa602494acb7@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Fabrice,

On 09/06/2019 17:15, Fabrice Fontaine wrote:
> +	XSLTPROC="False"

 I don't understand why you set this to False instead of false. AFAICS, this
variable only gets used as an executable to run, it doesn't get evaluated as a
python expression.

 Regards,
 Arnout

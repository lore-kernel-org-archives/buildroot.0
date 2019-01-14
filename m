From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 14 Jan 2019 19:31:05 +0100
Subject: [Buildroot] [PATCH 1/3] package/python3-setuptools: new package
In-Reply-To: <20181228170132.13049-2-thomas.petazzoni@bootlin.com>
References: <20181228170132.13049-1-thomas.petazzoni@bootlin.com>
 <20181228170132.13049-2-thomas.petazzoni@bootlin.com>
Message-ID: <eeadf2d8-96fd-a183-fb00-45fe67af51e2@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28/12/2018 18:01, Thomas Petazzoni wrote:
> +# Please keep in sync with
> +# package/python-setuptools/python-setuptools.mk

 It is in fact more important to have this comment in python-setuptools.mk,
because that is the one that most likely will be bumped...

 Note that, because you symlinked the hash file, autobuilders would eventually
discover such an issue anyway.

 Regards,
 Arnout

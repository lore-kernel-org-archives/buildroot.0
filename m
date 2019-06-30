From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 30 Jun 2019 14:59:12 +0200
Subject: [Buildroot] [PATCH] package/expat: security bump to version
 2.2.7
In-Reply-To: <20190628132613.8819-1-peter@korsgaard.com>
References: <20190628132613.8819-1-peter@korsgaard.com>
Message-ID: <8c0423f8-886a-a4a1-8707-71eca4fc3d7c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28/06/2019 15:26, Peter Korsgaard wrote:
> Fixes the following security vulnerabilites:
> 
> CVE-2018-20843: In libexpat in Expat before 2.2.7, XML input including XML
> names that contain a large number of colons could make the XML parser
> consume a high amount of RAM and CPU resources while processing (enough to
> be usable for denial-of-service attacks).
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

 Applied to master, thanks.

 Regards,
 Arnout

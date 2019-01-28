From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 28 Jan 2019 18:07:34 +0100
Subject: [Buildroot] [PATCH 7/8] utils/check-package: handle
 ifdef/ifndef in .mk files
In-Reply-To: <20190127185943.1136-8-ricardo.martincoski@gmail.com>
References: <20190127185943.1136-1-ricardo.martincoski@gmail.com>
 <20190127185943.1136-8-ricardo.martincoski@gmail.com>
Message-ID: <fb99f8ba-ebf6-ebbc-b1a2-79d11a4b99fe@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 27/01/2019 19:59, Ricardo Martincoski wrote:
> Currently check-package only knows about ifeq/ifneq.
> Add code to handle ifdef/ifndef as well.
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

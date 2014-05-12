From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 12 May 2014 12:44:16 -0300
Subject: [Buildroot] Enabling readline support in wpa_cli
In-Reply-To: <c0fce23a65a14e6cbd228a9ec03cf091@DB3PR04MB075.eurprd04.prod.outlook.com>
References: <6ef3c8ef78fb45e3b64d042d0a681898@DB3PR04MB075.eurprd04.prod.outlook.com>
 <c0fce23a65a14e6cbd228a9ec03cf091@DB3PR04MB075.eurprd04.prod.outlook.com>
Message-ID: <5370EC50.7020809@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/12/2014 11:16 AM, Oscar Hellstr?m wrote:

> I should probably have added the readline dependency as well, right?

Hi.
You mean adding a Config.in select? That's not necessary, we usually
handle these "details" automatically like you've already did in your
patch, otherwise it's (possibly) just making the target size bigger for
an option that wouldn't be used.
Could you resend your last patch (based on current git) with
git-send-email and a SoB line for proper attribution?
Thanks.

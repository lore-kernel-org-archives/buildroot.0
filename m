From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 26 Oct 2010 13:30:48 -0300
Subject: [Buildroot] Timezone
In-Reply-To: <4CC6C0A0.6050605@signaturealpha.com>
References: <20101025190834.3163.39351.stgit@localhost.localdomain>	<20101026120419.668b53d7@surf>
	<4CC6C0A0.6050605@signaturealpha.com>
Message-ID: <4CC70238.7030101@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/26/10 08:50, Marc Leclerc wrote:

> Hi,
> 
> Any options to have my system on UTC by default. As of default it is on
> MDT (Mountain Daylight)
> 
> Regards

That's defined in /etc/TZ in the target filesystem, which most of the
time comes from the target skeleton.
Replacing the file contents with "UTC" will do the trick.
Regards.

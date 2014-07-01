From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 01 Jul 2014 09:52:47 -0300
Subject: [Buildroot] [PATCH 3/3] sox: new package
In-Reply-To: <87tx71gs2d.fsf@dell.be.48ers.dk>
References: <1403919534-28847-1-git-send-email-gustavo@zacarias.com.ar>	<1403919534-28847-3-git-send-email-gustavo@zacarias.com.ar>
 <87tx71gs2d.fsf@dell.be.48ers.dk>
Message-ID: <53B2AF1F.9060602@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/01/2014 09:51 AM, Peter Korsgaard wrote:
> Any specific reason to unconditionally disable ffmpeg support?

Yes, it uses old API calls that aren't supported with our current version.
Regards.

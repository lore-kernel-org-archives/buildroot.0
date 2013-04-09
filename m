From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 09 Apr 2013 19:21:16 -0300
Subject: [Buildroot] [PATCH 3/3] python-m2crypto: new package
In-Reply-To: <51648B08.4040102@mind.be>
References: <1365532027-13639-1-git-send-email-gustavo@zacarias.com.ar>
 <1365532027-13639-3-git-send-email-gustavo@zacarias.com.ar>
 <51648B08.4040102@mind.be>
Message-ID: <5164945C.9000607@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/09/2013 06:41 PM, Arnout Vandecappelle wrote:

>  Is there a reason to make it host-only? Seems like this is potentially
> useful on target as well... Or do you expect build difficulties?

I've hit cross build issues, basically x86_64 for an ARM target isn't nice.
Seems some extra python tricks will be necessary for this one on the target.
Regards.

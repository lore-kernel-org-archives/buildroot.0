From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 04 Apr 2013 18:33:32 -0300
Subject: [Buildroot] [PATCH] openvpn: adjust iproute2 logic
In-Reply-To: <878v4y3tp2.fsf@dell.be.48ers.dk>
References: <1365094499-21046-1-git-send-email-gustavo@zacarias.com.ar>
 <878v4y3tp2.fsf@dell.be.48ers.dk>
Message-ID: <515DF1AC.8060506@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/04/2013 05:51 PM, Peter Korsgaard wrote:

> We'll most likely forget to update this next time we bump the busybox
> version, and not notice it as it's a runtime issue.
> 
> Could you invert the logic so you explicitly check for the old busybox
> versions instead?

True.
We'll likely forget to remove dead code too later on, but it doesn't hurt :)
Regards.

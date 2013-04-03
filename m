From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 03 Apr 2013 17:48:38 -0300
Subject: [Buildroot] [PATCH] dropbear: add vfork fix
In-Reply-To: <87zjxf5ol0.fsf@dell.be.48ers.dk>
References: <1364941788-15890-1-git-send-email-gustavo@zacarias.com.ar>
 <87zjxf5ol0.fsf@dell.be.48ers.dk>
Message-ID: <515C95A6.7090203@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/03/2013 05:47 PM, Peter Korsgaard wrote:

> Do we need the /dev/urandom write fix as well?

I don't think so, we default to 0666 for it in the device table...
Regards.

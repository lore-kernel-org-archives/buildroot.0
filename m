From: =?utf-8?B?SsOpcsO0bWU=?= Oufella <jerome.oufella@savoirfairelinux.com>
Date: Tue, 10 Mar 2015 23:44:44 -0400
Subject: [Buildroot] [PATCH] sunxi-mali: require fbset
In-Reply-To: <20150310233513.5d7906a8@free-electrons.com> (Thomas Petazzoni's
 message of "Tue, 10 Mar 2015 23:35:13 +0100")
References: <1426023433-24991-1-git-send-email-jerome.oufella@savoirfairelinux.com>
 <20150310233513.5d7906a8@free-electrons.com>
Message-ID: <8761a88afn.fsf@pcjo.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

> Well, there is also a fbset applet in Busybox, which is enabled in our
> default Busybox configuration. So normally, the out of the box user
> experience should be just fine.
>
> Are you running without Busybox? Or with a custom Busybox configuration?

You are the voice of rightness Thomas :-) I had removed the fbset
package executable without reinstalling busybox. As a result, no trace
of fbset with my default config, which led to this patch.

Sorry for the noise.

-- 
J?r?me Oufella

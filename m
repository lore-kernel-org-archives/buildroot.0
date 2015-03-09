From: =?utf-8?B?SsOpcsO0bWU=?= Oufella <jerome.oufella@savoirfairelinux.com>
Date: Mon, 09 Mar 2015 14:52:51 -0400
Subject: [Buildroot] [PATCH v2] libdri2: new package
In-Reply-To: <20150309153619.0f316d11@free-electrons.com> (Thomas Petazzoni's
 message of "Mon, 9 Mar 2015 15:36:19 +0100")
References: <1425906775-31621-1-git-send-email-jerome.oufella@savoirfairelinux.com>
 <1425907428-16094-1-git-send-email-jerome.oufella@savoirfairelinux.com>
 <20150309153619.0f316d11@free-electrons.com>
Message-ID: <87oao257gc.fsf@pcjo.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks Thomas for taking time for a great review.

Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

>> +LIBDRI2_SITE = https://github.com/robclark/libdri2.git
>
> Can you use the 'github' macro instead?

I tried in v1, but the macro would ultimately fail due to lack of
archive on github. Or is there something I missed ?

I will send an updated patch soon.

Best regards,

J?r?me

From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 09 Mar 2016 15:55:05 +0100
Subject: [Buildroot] [PATCH] pkgconf: make wrapper relocatable
In-Reply-To: <20160309155041.5aac1077@free-electrons.com> (Thomas Petazzoni's
 message of "Wed, 9 Mar 2016 15:50:41 +0100")
References: <1457529409-24102-1-git-send-email-gustavo@zacarias.com.ar>
 <87egbj228a.fsf@dell.be.48ers.dk> <56E02A78.1050701@zacarias.com.ar>
 <20160309150359.4ce78c05@free-electrons.com>
 <8760wv2079.fsf@dell.be.48ers.dk>
 <20160309155041.5aac1077@free-electrons.com>
Message-ID: <87shzzzoom.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> > STAGING_DIR=$(readlink -f ${WRAPPER_DIR}/../../../staging/)
 >> 
 >> This will only work if you keep the entire buildroot output around (or
 >> rather output/staging) and don't customize the BR2_HOST_DIR.

 > Indeed, so we need to do like Arnout suggests, hardcoding the tuple
 > inside the script, so that we really only on the contents of host/, and
 > not on the staging symlink.

Yes, like I proposed ;)

-- 
Venlig hilsen,
Peter Korsgaard 

From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Apr 2017 13:44:19 +0200
Subject: [Buildroot] [PATCH 1/1] package/libqmi: bump version to 1.18.0
In-Reply-To: <CANQCQpY=4Ag39u3YDetPzq8VNr5sqcmXhjZhMr69P3sRFvxhQw@mail.gmail.com>
 (Matthew Weber's message of "Thu, 27 Apr 2017 06:18:07 -0500")
References: <1493254942-38586-1-git-send-email-matthew.weber@rockwellcollins.com>
 <871ssemfh8.fsf@dell.be.48ers.dk>
 <CANQCQpY=4Ag39u3YDetPzq8VNr5sqcmXhjZhMr69P3sRFvxhQw@mail.gmail.com>
Message-ID: <87fugukrcc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matthew" == Matthew Weber <matthew.weber@rockwellcollins.com> writes:

Hi,

 >> > -# we don't want -Werror
 >> > -LIBQMI_CONF_OPTS = --enable-more-warnings=no
 >> > +# we don't want -Werror and disable gudev Gobject bindings
 >> 
 >> Why? It would be good to describe why we don't want udev support.


 > Sure, should I add more to the comment in the file or patch submission
 > that the gudev package currently isn't part of buildroot to provide
 > the Gobject bindings between libqmi and eudev?

Just adding it in the patch description is fine, thanks!

-- 
Bye, Peter Korsgaard

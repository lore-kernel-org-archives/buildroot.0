From: Alan Ott <alan@signal11.us>
Date: Sun, 12 Oct 2014 11:40:34 -0400
Subject: [Buildroot] [PATCH] python-pyqt: new package
In-Reply-To: <543A9CCD.6010006@signal11.us>
References: <1382190416-9928-1-git-send-email-sergey.kostanbaev@gmail.com>
 <CAGtNMfN5y9yU3P9E+cS=1XySGK=S1n_XKPkc9=gfzZ0eaiqv9w@mail.gmail.com>
 <543A9CCD.6010006@signal11.us>
Message-ID: <543AA0F2.7030603@signal11.us>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/12/2014 11:22 AM, Alan Ott wrote:
> On 02/12/2014 02:04 PM, sergey kostanbaev wrote:
>> Any comments about my patches (python-sip and python-pyqt)? Is 
>> something wrong with them?
>
> So I guess it comes down to:
> 1. Make sure it builds without sip being installed on the host system
> 2. Make sure it builds when "Approve Free License" 
> (BR2_PACKAGE_QT_LICENSE_APPROVED) is not set in the configuration.
>
> Thanks for the patch. This looks like it was a lot of work.

Hi Sergey,

Just to be clear, the state of the patch has been changed to Changes 
Requested. Please consider the above changes and re-submit.

Alan.

From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 11 Apr 2016 12:15:56 +0300
Subject: [Buildroot] Adding support for the Rust programming language
In-Reply-To: <570B6A67.1000806@mind.be>
References: <20160408224541.79e1ba4d@itchy> <570A77F9.50506@mind.be>
 <20160411103211.3d9a1581@free-electrons.com>
 <570B6A67.1000806@mind.be>
Message-ID: <20160411091556.GP3364@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Mon, Apr 11, 2016 at 11:12:07AM +0200, Arnout Vandecappelle wrote:
>  So, if python is used, please make sure it runs on any python (with full
> standard library) from python2.4 (RHEL5) to python3.5. That means that using
> the json standard library module is not an option, since it was introduced
> only in python 2.6.

The manual (http://nightly.buildroot.org/manual.html#requirement-mandatory) 
currently requires Python 2.6 or newer.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 4 Mar 2015 16:21:58 +0100
Subject: [Buildroot] [PATCH v2 7/8] arch: add support for AMD steamroller
In-Reply-To: <54F72233.5040904@zacarias.com.ar>
References: <1425397951-30603-1-git-send-email-gustavo@zacarias.com.ar>
 <1425397951-30603-7-git-send-email-gustavo@zacarias.com.ar>
 <20150304155953.7c43ee6c@free-electrons.com>
 <54F72233.5040904@zacarias.com.ar>
Message-ID: <20150304162158.1340d86f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 04 Mar 2015 12:18:11 -0300, Gustavo Zacarias wrote:

> > Why do we need this new dependency? Same question for x86_jaguar in
> > fact. Are those toolchains not working at all, or are they just not
> > "optimal" ?
> 
> Because older GCCs won't understand bdver3/btver2 and break.
> Regards.

Ah, hum, yes, makes sense. Thanks for the clarification.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

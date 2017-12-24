From: Waldemar Brodkorb <wbx@openadk.org>
Date: Sun, 24 Dec 2017 11:38:03 +0100
Subject: [Buildroot] systemd: build failure against pam on arm
In-Reply-To: <873741w59p.fsf@paral.in>
References: <CA+h8R2q1W9PZ8DbTDuxZQhg3+hauZqaDdwzFAGgmTJd7KqiQEg@mail.gmail.com>
 <87fufjgycd.fsf@dell.be.48ers.dk>
 <CA+h8R2qdYZkwynNoPKjiDynzs_gs=TfFZ7i-STGrednoG4O-ew@mail.gmail.com>
 <CA+h8R2o8=LmmcudEaiJSCenX7t4QmHB3SPwm-UowrGQEu2bMPw@mail.gmail.com>
 <29DD8155-F769-488E-8A9E-39D8B6D18B54@openadk.org>
 <87608xykge.fsf@paral.in>
 <1397D1DC-9330-40CF-89AB-8CB27EEFF333@openadk.org>
 <873741w59p.fsf@paral.in>
Message-ID: <20171224103803.GW27558@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Christian Stewart wrote,

> Hi Waldemar,
> 
> Thank you for looking into this-
> 
> Waldemar Brodkorb <wbx@openadk.org> writes:
> > check config.log where pam_misc is added. May be configure has a bug and detects your host pam under certain conditions.
> 
> Seems like it.
> 
> > PAM_LIBS='-lpam -lpam_misc'
> 

Is there a copy of libpam_misc.so somewhere in your buildroot
directory?

best regards
 Waldemar

From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 08 Mar 2018 10:02:28 +0100
Subject: [Buildroot] [PATCH 1/4] tpm2-tss: new package
In-Reply-To: <20180202155614.26938-2-casantos@datacom.ind.br> (Carlos Santos's
 message of "Fri, 2 Feb 2018 13:56:11 -0200")
References: <20180202155614.26938-1-casantos@datacom.ind.br>
 <20180202155614.26938-2-casantos@datacom.ind.br>
Message-ID: <876067j5y3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Carlos" == Carlos Santos <casantos@datacom.ind.br> writes:

 > OSS implementation of the TCG TPM2 Software Stack (TSS2). This stack
 > consists of the following layers from top to bottom:

 > * System API (SAPI) as described in the system level API and TPM command
 >   transmission interface specification. This API is a 1-to-1 mapping of
 >   the TPM2 commands documented in Part 3 of the TPM2 specification.
 >   Additionally there are asynchronous versions of each command. These
 >   asynchronous variants may be useful for integration into event-driven
 >   programming environments. Both the synchronous and asynchronous API
 >   are exposed through a single library: libsapi.

 > * TPM Command Transmission Interface (TCTI) that is described in the
 >   same specification. This API provides a standard interface to transmit
 >   / receive TPM command / response buffers. It is expected that any
 >   number of libraries implementing the TCTI API will be implemented as a
 >   way to abstract various platform specific IPC mechanisms. Currently
 >   this repository provides two TCTI implementations: libtcti-device and
 >   libtcti-socket. The prior should be used for direct access to the TPM
 >   through the Linux kernel driver. The later implements the protocol
 >   exposed by the Microsoft software TPM2 simulator.

 > Signed-off-by: Carlos Santos <casantos@datacom.ind.br>

Committed, thanks.

-- 
Bye, Peter Korsgaard

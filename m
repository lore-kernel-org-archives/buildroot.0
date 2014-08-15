From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 15 Aug 2014 11:24:29 +0200
Subject: [Buildroot] [PATCH] erlang: bump to version 17.1
In-Reply-To: <1407945105-4700-1-git-send-email-fhunleth@troodon-software.com>
 (Frank Hunleth's message of "Wed, 13 Aug 2014 11:51:45 -0400")
References: <1407945105-4700-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <87k36a2jhu.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Frank" == Frank Hunleth <fhunleth@troodon-software.com> writes:

 > Erlang/OTP 17.1 is a service release on the 17 track with mostly bug
 > fixes, but it does contain a number of new features and characteristics
 > improvements as well.

 > Some highlights of the release are:
 >   - crypto: Add aes_cfb8 cypher to crypto:block_encrypt and block_decrypt.
 >   - diameter: Add result code counters for CEA, DWA, and DPA.
 >   - erts: The following built in functions in the erlang and binary modules
 >     now bump an appropriate amount of reductions and yield when out of
 >     reductions:
 >     binary_to_list/1, binary_to_list/3, bitstring_to_list/1,
 >     list_to_binary/1,
 >     iolist_to_binary/1, list_to_bitstring/1, binary:list_to_bin/1
 >   - hipe: Handle Maps instructions get_map_elements, put_map_assoc,
 >     put_map_exact in the HiPE native code compiler.
 >   - mnesia: The time for inserting locks for a transaction with large
 >     number of locks is reduced significantly.
 >   - ssh: Option max_sessions added to ssh:daemon/{2,3}.
 >   - stdlib: Add maps:get/3 to maps module. The function will return the
 >     supplied default value if the key does not exist in the map.

 > Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>

Committed to next, thanks.

-- 
Bye, Peter Korsgaard

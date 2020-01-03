%% -*- mode: erlang; tab-width: 4; indent-tabs-mode: 1; st-rulers: [70] -*-
%% vim: ts=4 sw=4 ft=erlang noet
%%%-------------------------------------------------------------------
%%% @author Andrew Bennett <potatosaladx@gmail.com>
%%% @copyright 2014-2020, Andrew Bennett
%%% @doc
%%%
%%% @end
%%% Created :  02 Jan 2020 by Andrew Bennett <potatosaladx@gmail.com>
%%%-------------------------------------------------------------------
-module(jose_jwk_der).

-include_lib("public_key/include/public_key.hrl").

%% API
-export([from_binary/1]).
-export([from_binary/2]).
% -export([from_certificate/1]).
% -export([from_public_key_info/1]).
% -export([to_binary/3]).

%%====================================================================
%% API functions
%%====================================================================

from_binary(DERBinary) when is_binary(DERBinary) ->
    case jose_public_key:der_decode(DERBinary) of
		% {ok, CertificatePEMEntry={'Certificate', _, not_encrypted}} ->
			% jose_jwk_pem:from_certificate(CertificatePEMEntry);
		Key ->
			jose_jwk_kty:from_key(Key)
		% [CertificatePEMEntry={'Certificate', _, not_encrypted}] ->
		% 	jose_jwk_pem:from_certificate(CertificatePEMEntry);
		% [PEMEntry] ->
		% 	jose_jwk_kty:from_key(jose_public_key:pem_entry_decode(PEMEntry));
		% PEMDecodeError ->
		% 	PEMDecodeError
	end.

from_binary(Password, DERBinary) when is_binary(DERBinary) ->
    case jose_public_key:der_decode(Password, DERBinary) of
		% {ok, CertificatePEMEntry={'Certificate', _, not_encrypted}} ->
			% jose_jwk_pem:from_certificate(CertificatePEMEntry);
		Key ->
			jose_jwk_kty:from_key(Key)
		% [CertificatePEMEntry={'Certificate', _, not_encrypted}] ->
		% 	jose_jwk_pem:from_certificate(CertificatePEMEntry);
		% [PEMEntry] ->
		% 	jose_jwk_kty:from_key(jose_public_key:pem_entry_decode(PEMEntry));
		% PEMDecodeError ->
		% 	PEMDecodeError
	end.

% from_binary(PEMBinary) when is_binary(PEMBinary) ->
% 	case jose_public_key:pem_decode(PEMBinary) of
% 		[CertificatePEMEntry={'Certificate', _, not_encrypted}] ->
% 			from_certificate(CertificatePEMEntry);
% 		[PEMEntry] ->
% 			jose_jwk_kty:from_key(jose_public_key:pem_entry_decode(PEMEntry));
% 		PEMDecodeError ->
% 			PEMDecodeError
% 	end.

% from_binary(Password, EncryptedPEMBinary) when is_binary(EncryptedPEMBinary) ->
% 	case jose_public_key:pem_decode(EncryptedPEMBinary) of
% 		[EncryptedPEMEntry] ->
% 			PasswordString = unicode:characters_to_list(Password),
% 			jose_jwk_kty:from_key(jose_public_key:pem_entry_decode(EncryptedPEMEntry, PasswordString));
% 		PEMDecodeError ->
% 			PEMDecodeError
% 	end.

% from_certificate(CertificateBinary) when is_binary(CertificateBinary) ->
% 	case jose_public_key:pem_decode(CertificateBinary) of
% 		[CertificatePEMEntry={'Certificate', _, not_encrypted}] ->
% 			from_certificate(CertificatePEMEntry);
% 		PEMDecodeError ->
% 			{error, {pem_decode, PEMDecodeError}}
% 	end;
% from_certificate(CertificatePEMEntry={'Certificate', _, not_encrypted}) ->
% 	case jose_public_key:pem_entry_decode(CertificatePEMEntry) of
% 		Certificate=#'Certificate'{} ->
% 			from_certificate(Certificate);
% 		PEMEntryDecodeError ->
% 			{error, {pem_entry_decode, PEMEntryDecodeError}}
% 	end;
% from_certificate(#'Certificate'{tbsCertificate=#'TBSCertificate'{subjectPublicKeyInfo=#'SubjectPublicKeyInfo'{}=SubjectPublicKeyInfo}}) ->
% 	from_public_key_info(SubjectPublicKeyInfo).

% from_public_key_info(#'SubjectPublicKeyInfo'{algorithm=#'AlgorithmIdentifier'{}}=SubjectPublicKeyInfo) ->
% 	from_public_key_info(jose_public_key:pem_entry_encode('SubjectPublicKeyInfo', SubjectPublicKeyInfo));
% from_public_key_info(PEMEntry={'SubjectPublicKeyInfo', DER, not_encrypted}) when is_binary(DER) ->
% 	jose_jwk_kty:from_key(jose_public_key:pem_entry_decode(PEMEntry)).

% to_binary(Password, KeyType, Key) ->
% 	% CipherInfo = {"AES-128-CBC", crypto:strong_rand_bytes(16)},
% 	CipherInfo = {"DES-EDE3-CBC", crypto:strong_rand_bytes(8)},
% 	PasswordString = binary_to_list(iolist_to_binary(Password)),
% 	PEMEntry = jose_public_key:pem_entry_encode(KeyType, Key, {CipherInfo, PasswordString}),
% 	jose_public_key:pem_encode([PEMEntry]).

%%%-------------------------------------------------------------------
%%% Internal functions
%%%-------------------------------------------------------------------
